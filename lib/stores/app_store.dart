import 'package:mobx/mobx.dart';

import '../models/article.dart';
import '../models/category.dart';
import '../models/feed.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
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
  List<Article> get starredArticles =>
      allFeeds.expand((f) => f.articles).where((a) => a.isStarred).toList();

  @computed
  int get totalUnreadCount =>
      categories.fold(0, (sum, category) => sum + category.totalUnread);

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
  void addCategory(Category category) => categories.add(category);

  @action
  void removeCategory(Category category) => categories.remove(category);

  @action
  void setCategories(List<Category> newCategories) {
    categories.clear();
    categories.addAll(newCategories);
  }
}
