import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/di/dependencies.dart';
import '../../../models/feed.dart';

class FeedListContent extends StatelessWidget {
  final String? selectedFeedId;
  final Function(Feed) onFeedSelected;

  const FeedListContent({
    super.key,
    this.selectedFeedId,
    required this.onFeedSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListView(
          children: [
            if (layoutStore.isMobile)
              ListTile(
                leading: const Icon(Icons.close),
                title: const Text('关闭'),
                onTap: () => Navigator.of(context).pop(),
              ),
            ListTile(
              leading: const Icon(Icons.all_inbox),
              title: const Text('全部'),
              trailing: Text(appStore.totalUnreadCount.toString()),
              selected: selectedFeedId == null,
              onTap: () {
                appStore.selectFeed(null);
                if (layoutStore.isMobile) {
                  Navigator.of(context).pop();
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('收藏'),
              trailing: Text(appStore.starredArticles.length.toString()),
              selected: selectedFeedId == 'starred',
              onTap: () {
                // TODO: 处理收藏文章
                if (layoutStore.isMobile) {
                  Navigator.of(context).pop();
                }
              },
            ),
            const Divider(),
            ...appStore.categories.map((category) {
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
                    onTap: () {
                      onFeedSelected(feed);
                      if (layoutStore.isMobile) {
                        Navigator.of(context).pop();
                      }
                    },
                  );
                }).toList(),
              );
            }).toList(),
          ],
        );
      },
    );
  }
}
