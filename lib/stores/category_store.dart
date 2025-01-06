import 'package:mobx/mobx.dart';

import '../models/category.dart';
import '../models/feed.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  final Category category;

  @observable
  ObservableList<Feed> feeds = ObservableList<Feed>();

  _CategoryStore(this.category) {
    feeds.addAll(category.feeds);
  }

  @computed
  int get totalUnread => feeds.fold(0, (sum, feed) => sum + feed.unreadCount);

  @action
  void addFeed(Feed feed) {
    feeds.add(feed);
    category.feeds.add(feed);
  }

  @action
  void removeFeed(Feed feed) {
    feeds.remove(feed);
    category.feeds.remove(feed);
  }

  @action
  void setFeeds(List<Feed> newFeeds) {
    feeds.clear();
    feeds.addAll(newFeeds);
    category.feeds.clear();
    category.feeds.addAll(newFeeds);
  }
}
