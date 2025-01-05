import 'package:flutter/material.dart';

import '../../../core/di/dependencies.dart';
import '../../../models/feed.dart';
import 'feed_list_content.dart';

class FeedList extends StatelessWidget {
  final String? selectedFeedId;
  final Function(Feed) onFeedSelected;

  const FeedList({
    super.key,
    this.selectedFeedId,
    required this.onFeedSelected,
  });

  @override
  Widget build(BuildContext context) {
    // 移动端和平板端不显示标题栏，由外层控制
    if (!layoutStore.isDesktop) {
      return FeedListContent(
        selectedFeedId: selectedFeedId,
        onFeedSelected: onFeedSelected,
      );
    }

    // 桌面端显示标题栏
    return Column(
      children: [
        AppBar(
          title: const Text('订阅'),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                // TODO: 实现刷新功能
              },
            ),
          ],
        ),
        Expanded(
          child: FeedListContent(
            selectedFeedId: selectedFeedId,
            onFeedSelected: onFeedSelected,
          ),
        ),
      ],
    );
  }
}
