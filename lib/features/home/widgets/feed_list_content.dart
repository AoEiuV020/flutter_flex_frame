import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/di/dependencies.dart';
import '../../../stores/app_store.dart';
import '../../../stores/layout_store.dart';

class FeedListContent extends StatelessWidget {
  final String? selectedFeedId;
  final Function(String) onFeedSelected;

  const FeedListContent({
    super.key,
    this.selectedFeedId,
    required this.onFeedSelected,
  });

  @override
  Widget build(BuildContext context) {
    final appStore = getIt<AppStore>();
    final layoutStore = getIt<LayoutStore>();

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
              onTap: () => onFeedSelected('all'),
            ),
            const Divider(),
            ...appStore.categories.map((category) {
              final categoryFeeds = appStore.getFeedsByCategory(category);
              return ExpansionTile(
                leading: const Icon(Icons.folder),
                title: Text(category),
                children: [
                  ...categoryFeeds.map((feed) => ListTile(
                        leading: const Icon(Icons.rss_feed),
                        title: Text(feed.title),
                        trailing: Text(feed.unreadCount.toString()),
                        selected: feed.id == selectedFeedId,
                        onTap: () => onFeedSelected(feed.id),
                      )),
                ],
              );
            }),
          ],
        );
      },
    );
  }
}
