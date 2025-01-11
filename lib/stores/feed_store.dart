import 'package:mobx/mobx.dart';

import '../core/database/database.dart';
import '../repositories/feed_repository.dart';

part 'feed_store.g.dart';

class FeedStore = _FeedStore with _$FeedStore;

abstract class _FeedStore with Store {
  final FeedRepository _repository;

  _FeedStore(this._repository);

  @observable
  ObservableList<FeedTableData> feeds = ObservableList<FeedTableData>();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadFeeds() async {
    isLoading = true;
    try {
      final loadedFeeds = await _repository.getAllFeeds();
      feeds.clear();
      feeds.addAll(loadedFeeds);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> addFeed(FeedTableCompanion feed) async {
    await _repository.insertFeed(feed);
    await loadFeeds();
  }

  @action
  Future<void> updateFeed(FeedTableCompanion feed) async {
    await _repository.updateFeed(feed);
    await loadFeeds();
  }

  @action
  Future<void> deleteFeed(String id) async {
    await _repository.deleteFeed(id);
    await loadFeeds();
  }

  @action
  Future<void> updateUnreadCount(String feedId, int count) async {
    await _repository.updateUnreadCount(feedId, count);
    await loadFeeds();
  }
}
