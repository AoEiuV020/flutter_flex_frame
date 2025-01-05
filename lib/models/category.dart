import 'package:mobx/mobx.dart';

import 'feed.dart';

part 'category.g.dart';

class Category = _Category with _$Category;

abstract class _Category with Store {
  final String id;
  final String name;

  @observable
  ObservableList<Feed> feeds = ObservableList<Feed>();

  _Category({
    required this.id,
    required this.name,
  });

  @computed
  int get totalUnread => feeds.fold(0, (sum, feed) => sum + feed.unreadCount);

  @action
  void addFeed(Feed feed) => feeds.add(feed);

  @action
  void removeFeed(Feed feed) => feeds.remove(feed);

  @action
  void setFeeds(List<Feed> newFeeds) {
    feeds.clear();
    feeds.addAll(newFeeds);
  }
}
