import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../core/di/dependencies.dart';
import '../../../stores/app_store.dart';
import 'feed_list_content.dart';

class FeedList extends StatelessWidget {
  final String? selectedFeedId;
  final Function(String?) onFeedSelected;

  AppStore get appStore => getIt<AppStore>();

  const FeedList({
    super.key,
    this.selectedFeedId,
    required this.onFeedSelected,
  });

  void _handleRefresh() {
    // 模拟刷新：重新设置所有分类
    final categories = appStore.categories.toList();
    appStore.setCategories([]);
    Future.delayed(const Duration(milliseconds: 500), () {
      appStore.setCategories(categories);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FeedListContent(
            selectedFeedId: selectedFeedId,
            onFeedSelected: (id) {
              if (id == null) {
                onFeedSelected(null);
                return;
              }
              final feed = appStore.feeds.firstWhere((f) => f.id == id);
              onFeedSelected(feed.id);
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: _handleRefresh,
                tooltip: '刷新',
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  context.push('/feed/add');
                },
                tooltip: '添加订阅',
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  context.push('/settings');
                },
                tooltip: '设置',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
