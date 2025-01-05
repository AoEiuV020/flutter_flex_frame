import 'package:mobx/mobx.dart';

import 'article.dart';

part 'feed.g.dart';

class Feed = _Feed with _$Feed;

abstract class _Feed with Store {
  final String id;
  final String title;
  final String url;
  final String? iconUrl;
  final String category;

  @observable
  int unreadCount = 0;

  @observable
  DateTime lastUpdated;

  @observable
  ObservableList<Article> articles = ObservableList<Article>();

  _Feed({
    required this.id,
    required this.title,
    required this.url,
    // ignore: unused_element
    this.iconUrl,
    required this.category,
    required this.lastUpdated,
  });

  @action
  void incrementUnread() => unreadCount++;

  @action
  void decrementUnread() {
    if (unreadCount > 0) unreadCount--;
  }

  @action
  void setUnreadCount(int count) => unreadCount = count;

  @action
  void updateLastUpdated(DateTime time) => lastUpdated = time;

  @action
  void addArticle(Article article) => articles.add(article);

  @action
  void removeArticle(Article article) => articles.remove(article);

  @action
  void setArticles(List<Article> newArticles) {
    articles.clear();
    articles.addAll(newArticles);
  }
}
