import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/di/dependencies.dart';
import '../../models/feed.dart';

class FeedEditPage extends StatefulWidget {
  final String? feedId;

  const FeedEditPage({
    super.key,
    this.feedId,
  });

  @override
  State<FeedEditPage> createState() => _FeedEditPageState();
}

class _FeedEditPageState extends State<FeedEditPage> {
  final _formKey = GlobalKey<FormState>();
  final _urlController = TextEditingController();
  final _titleController = TextEditingController();
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    if (widget.feedId != null) {
      final feed = appStore.allFeeds.firstWhere((f) => f.id == widget.feedId);
      _urlController.text = feed.url;
      _titleController.text = feed.title;
      _selectedCategory = feed.category;
    }
  }

  @override
  void dispose() {
    _urlController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.feedId != null ? 'feed.edit'.tr() : 'feed.add'.tr(),
        ),
        actions: [
          TextButton(
            onPressed: _save,
            child: Text('common.save'.tr()),
          ),
        ],
      ),
      body: Observer(
        builder: (context) {
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: _urlController,
                  decoration: const InputDecoration(
                    labelText: 'URL',
                    hintText: 'https://example.com/feed',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'URL不能为空';
                    }
                    if (!Uri.tryParse(value)!.isAbsolute) {
                      return '请输入有效的URL';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: '标题',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '标题不能为空';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: const InputDecoration(
                    labelText: '分类',
                  ),
                  items: [
                    ...appStore.categories.map(
                      (category) => DropdownMenuItem(
                        value: category.id,
                        child: Text(category.name),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return '请选择分类';
                    }
                    return null;
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      final feed = Feed(
        id: widget.feedId ?? DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        url: _urlController.text,
        category: _selectedCategory!,
        lastUpdated: DateTime.now(),
      );

      final category = appStore.categories.firstWhere(
        (c) => c.id == _selectedCategory,
      );
      final categoryStore = appStore.getCategoryStore(category);

      if (widget.feedId != null) {
        // 更新订阅
        categoryStore.removeFeed(
          category.feeds.firstWhere((f) => f.id == widget.feedId),
        );
      }
      categoryStore.addFeed(feed);

      Navigator.of(context).pop();
    }
  }
}
