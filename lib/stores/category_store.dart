import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../core/database/database.dart';

part 'category_store.g.dart';

class CategoryStore = _CategoryStore with _$CategoryStore;

abstract class _CategoryStore with Store {
  final AppDatabase _db;

  _CategoryStore() : _db = GetIt.I<AppDatabase>();

  @observable
  ObservableList<FeedTableData> feeds = ObservableList<FeedTableData>();

  @observable
  bool isLoading = false;

  @computed
  int get totalUnread => feeds.fold(0, (sum, feed) => sum + feed.unreadCount);

  @action
  Future<void> loadFeeds(String categoryId) async {
    isLoading = true;
    try {
      final results = await _db.getFeedsByCategory(categoryId);
      feeds = ObservableList.of(results);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> addFeed(FeedTableCompanion feed) async {
    await _db.insertFeed(feed);
    await loadFeeds(feed.category.value);
  }

  @action
  Future<void> removeFeed(String id, String categoryId) async {
    await _db.deleteFeed(id);
    await loadFeeds(categoryId);
  }
}
