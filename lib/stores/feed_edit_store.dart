import 'package:drift/drift.dart';
import 'package:mobx/mobx.dart';

import '../core/database/database.dart';
import '../core/di/dependencies.dart';
import '../repositories/feed_repository.dart';

part 'feed_edit_store.g.dart';

class FeedEditStore = _FeedEditStore with _$FeedEditStore;

abstract class _FeedEditStore with Store {
  final _feedRepository = getIt<FeedRepository>();

  @observable
  String title = '';

  @observable
  String url = '';

  @observable
  String category = 'Technology';

  @observable
  String? iconUrl;

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  String? feedId;

  @observable
  ObservableList<String> availableCategories = ObservableList<String>();

  @action
  void setTitle(String value) => title = value;

  @action
  void setUrl(String value) => url = value;

  @action
  void setCategory(String value) => category = value;

  @action
  void setIconUrl(String? value) => iconUrl = value;

  @computed
  bool get isValid => title.isNotEmpty && url.isNotEmpty && category.isNotEmpty;

  @action
  Future<void> init(String? id) async {
    if (id != null) {
      await loadFeed(id);
    }
    await loadCategories();
  }

  @action
  Future<bool> save() async {
    if (!isValid) return false;

    isLoading = true;
    error = null;

    try {
      final feed = FeedTableCompanion.insert(
        id: feedId ?? DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        url: url,
        iconUrl: Value(iconUrl),
        category: category,
        unreadCount: const Value(0),
        lastUpdated: DateTime.now(),
      );

      await _feedRepository.insertFeed(feed);
      return true;
    } catch (e) {
      error = e.toString();
      return false;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadFeed(String id) async {
    isLoading = true;
    error = null;

    try {
      final feed = await _feedRepository.getFeedById(id);
      if (feed != null) {
        feedId = feed.id;
        title = feed.title;
        url = feed.url;
        category = feed.category;
        iconUrl = feed.iconUrl;
      }
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> loadCategories() async {
    try {
      final feeds = await _feedRepository.getAllFeeds();
      final categories = feeds.map((feed) => feed.category).toSet().toList();
      availableCategories.clear();
      availableCategories.addAll(categories);
      if (!availableCategories.contains(category)) {
        availableCategories.add(category);
      }
    } catch (e) {
      error = e.toString();
    }
  }
}
