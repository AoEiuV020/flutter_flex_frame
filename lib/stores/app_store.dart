import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import '../core/database/database.dart';
import '../core/di/dependencies.dart';
import '../repositories/article_repository.dart';
import '../repositories/feed_repository.dart';
import 'article_store.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  final _feedRepository = getIt<FeedRepository>();
  final _articleRepository = getIt<ArticleRepository>();
  final Map<String, ArticleStore> _articleStores = {};

  @observable
  ObservableList<FeedTableData> feeds = ObservableList<FeedTableData>();

  @observable
  ObservableList<ArticleTableData> articles =
      ObservableList<ArticleTableData>();

  @observable
  String? selectedFeedId;

  @observable
  String? selectedArticleId;

  @observable
  ObservableList<String> categories = ObservableList<String>();

  @observable
  ThemeMode themeMode = ThemeMode.system;

  @observable
  Locale locale = const Locale('zh', 'CN');

  @observable
  double fontSize = 16.0;

  @computed
  FeedTableData? get selectedFeed => selectedFeedId == null
      ? null
      : feeds.cast<FeedTableData?>().firstWhere(
            (feed) => feed?.id == selectedFeedId,
            orElse: () => null,
          );

  @computed
  ArticleTableData? get selectedArticle => selectedArticleId == null
      ? null
      : articles.cast<ArticleTableData?>().firstWhere(
            (article) => article?.id == selectedArticleId,
            orElse: () => null,
          );

  @computed
  List<ArticleTableData> get currentArticles => articles.toList();

  @computed
  List<ArticleTableData> get starredArticles =>
      articles.where((article) => article.isStarred).toList();

  @computed
  int get totalUnreadCount =>
      feeds.fold(0, (sum, feed) => sum + feed.unreadCount);

  ArticleStore getArticleStore(String articleId) {
    if (!_articleStores.containsKey(articleId)) {
      final article = articles.firstWhere((a) => a.id == articleId);
      _articleStores[articleId] = ArticleStore(article, _articleRepository);
    }
    return _articleStores[articleId]!;
  }

  @action
  Future<void> loadFeeds() async {
    final loadedFeeds = await _feedRepository.getAllFeeds();
    feeds.clear();
    feeds.addAll(loadedFeeds);
    await _updateCategories();
  }

  @action
  Future<void> loadArticles(String feedId) async {
    final loadedArticles = await _articleRepository.getArticlesByFeed(feedId);
    articles.clear();
    articles.addAll(loadedArticles);
  }

  @action
  void selectFeed(String? feedId) {
    selectedFeedId = feedId;
    if (feedId != null) {
      loadArticles(feedId);
    } else {
      articles.clear();
    }
    selectedArticleId = null;
  }

  @action
  void selectArticle(String? articleId) {
    selectedArticleId = articleId;
    if (articleId != null) {
      _articleRepository.markAsRead(articleId);
    }
  }

  @action
  Future<void> toggleArticleStarred(String articleId) async {
    await _articleRepository.toggleStarred(articleId);
    if (selectedFeedId != null) {
      await loadArticles(selectedFeedId!);
    }
  }

  @action
  Future<void> refresh() async {
    await loadFeeds();
    if (selectedFeedId != null) {
      await loadArticles(selectedFeedId!);
    }
  }

  @action
  void setThemeMode(ThemeMode mode) {
    themeMode = mode;
  }

  @action
  void setLocale(Locale newLocale) {
    locale = newLocale;
  }

  @action
  void setFontSize(double size) {
    fontSize = size;
  }

  @action
  Future<void> _updateCategories() async {
    final uniqueCategories =
        feeds.map((feed) => feed.category).toSet().toList();
    categories.clear();
    categories.addAll(uniqueCategories);
  }

  @action
  void setCategories(List<String> newCategories) {
    categories.clear();
    categories.addAll(newCategories);
  }

  List<FeedTableData> getFeedsByCategory(String category) {
    return feeds.where((feed) => feed.category == category).toList();
  }

  @action
  Future<void> cleanupCache() async {
    // 默认缓存7天
    const maxAge = Duration(days: 7);
    await _articleRepository.cleanupCache(maxAge);
    if (selectedFeedId != null) {
      await loadArticles(selectedFeedId!);
    }
  }
}
