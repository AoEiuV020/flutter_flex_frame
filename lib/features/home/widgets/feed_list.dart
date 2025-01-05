import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/di/dependencies.dart';
import '../../../models/feed.dart';

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
    return Observer(
      builder: (context) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('app.title'.tr()),
              centerTitle: true,
              floating: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    // TODO: 实现刷新功能
                  },
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: ListTile(
                leading: const Icon(Icons.all_inbox),
                title: Text('feed.all'.tr()),
                trailing: Text(appStore.totalUnreadCount.toString()),
                selected: selectedFeedId == null,
                onTap: () {
                  appStore.selectFeed(null);
                },
              ),
            ),
            SliverToBoxAdapter(
              child: ListTile(
                leading: const Icon(Icons.star),
                title: Text('feed.starred'.tr()),
                trailing: Text(appStore.starredArticles.length.toString()),
                selected: selectedFeedId == 'starred',
                onTap: () {
                  // TODO: 处理收藏文章
                },
              ),
            ),
            const SliverToBoxAdapter(
              child: Divider(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final category = appStore.categories[index];
                  return ExpansionTile(
                    leading: const Icon(Icons.folder),
                    title: Text(category.name),
                    trailing: Text(category.totalUnread.toString()),
                    children: category.feeds.map((feed) {
                      return ListTile(
                        leading: feed.iconUrl != null
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(feed.iconUrl!),
                              )
                            : const Icon(Icons.rss_feed),
                        title: Text(feed.title),
                        trailing: Text(feed.unreadCount.toString()),
                        selected: feed.id == selectedFeedId,
                        onTap: () => onFeedSelected(feed),
                      );
                    }).toList(),
                  );
                },
                childCount: appStore.categories.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
