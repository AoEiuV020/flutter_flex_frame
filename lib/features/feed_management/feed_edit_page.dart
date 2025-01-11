import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/di/dependencies.dart';
import '../../stores/feed_edit_store.dart';

class FeedEditPage extends StatefulWidget {
  final String? feedId;

  const FeedEditPage({super.key, this.feedId});

  @override
  State<FeedEditPage> createState() => _FeedEditPageState();
}

class _FeedEditPageState extends State<FeedEditPage> {
  final _store = getIt<FeedEditStore>();

  @override
  void initState() {
    super.initState();
    if (widget.feedId != null) {
      _store.loadFeed(widget.feedId!);
    }
  }

  void _handleSave() {
    _store.save().then((success) {
      if (success && mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.feedId == null ? '添加订阅' : '编辑订阅'),
          actions: [
            if (_store.isValid)
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: _handleSave,
              ),
          ],
        ),
        body: _store.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  if (_store.error != null)
                    Card(
                      color: Theme.of(context).colorScheme.errorContainer,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          _store.error!,
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onErrorContainer,
                          ),
                        ),
                      ),
                    ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: '标题',
                      hintText: '请输入订阅源标题',
                    ),
                    controller: TextEditingController(text: _store.title),
                    onChanged: (value) => _store.setTitle(value),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'URL',
                      hintText: '请输入订阅源地址',
                    ),
                    controller: TextEditingController(text: _store.url),
                    onChanged: (value) => _store.setUrl(value),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: '分类',
                      hintText: '请输入分类名称',
                    ),
                    controller: TextEditingController(text: _store.category),
                    onChanged: (value) => _store.setCategory(value),
                  ),
                ],
              ),
      ),
    );
  }
}
