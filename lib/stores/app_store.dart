import 'package:mobx/mobx.dart';

import '../models/article.dart';
import '../models/category.dart';
import '../models/feed.dart';
import 'article_store.dart';
import 'category_store.dart';
import 'feed_store.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  final Map<String, ArticleStore> _articleStores = {};
  final Map<String, FeedStore> _feedStores = {};
  final Map<String, CategoryStore> _categoryStores = {};

  @observable
  ObservableList<Category> categories = ObservableList<Category>();

  @observable
  Category? selectedCategory;

  @observable
  Feed? selectedFeed;

  @observable
  Article? selectedArticle;

  @observable
  bool isDarkMode = false;

  @observable
  double fontSize = 16.0;

  @computed
  List<Feed> get allFeeds => categories.expand((c) => c.feeds).toList();

  @computed
  List<Article> get allArticles => allFeeds.expand((f) => f.articles).toList();

  @computed
  List<Article> get currentArticles => selectedFeed?.articles ?? allArticles;

  @computed
  List<Article> get starredArticles =>
      allArticles.where((a) => getArticleStore(a).isStarred).toList();

  @computed
  int get totalUnreadCount => categories.fold(
      0, (sum, category) => sum + getCategoryStore(category).totalUnread);

  ArticleStore getArticleStore(Article article) {
    return _articleStores.putIfAbsent(
      article.id,
      () => ArticleStore(article),
    );
  }

  FeedStore getFeedStore(Feed feed) {
    return _feedStores.putIfAbsent(
      feed.id,
      () => FeedStore(feed),
    );
  }

  CategoryStore getCategoryStore(Category category) {
    return _categoryStores.putIfAbsent(
      category.id,
      () => CategoryStore(category),
    );
  }

  @action
  void selectCategory(Category? category) => selectedCategory = category;

  @action
  void selectFeed(Feed? feed) => selectedFeed = feed;

  @action
  void selectArticle(Article? article) => selectedArticle = article;

  @action
  void toggleDarkMode() => isDarkMode = !isDarkMode;

  @action
  void setFontSize(double size) => fontSize = size;

  @action
  void addCategory(Category category) {
    categories.add(category);
    getCategoryStore(category); // 确保创建 store
  }

  @action
  void removeCategory(Category category) {
    categories.remove(category);
    _categoryStores.remove(category.id);

    // 清理相关的 stores
    for (var feed in category.feeds) {
      _feedStores.remove(feed.id);
      for (var article in feed.articles) {
        _articleStores.remove(article.id);
      }
    }
  }

  @action
  void setCategories(List<Category> newCategories) {
    // 清理旧的 stores
    _categoryStores.clear();
    _feedStores.clear();
    _articleStores.clear();

    categories.clear();
    categories.addAll(newCategories);

    // 初始化新的 stores
    for (var category in newCategories) {
      getCategoryStore(category);
      for (var feed in category.feeds) {
        getFeedStore(feed);
        for (var article in feed.articles) {
          getArticleStore(article);
        }
      }
    }
  }
}
