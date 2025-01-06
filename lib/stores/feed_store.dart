import 'package:mobx/mobx.dart';

import '../models/article.dart';
import '../models/feed.dart';

part 'feed_store.g.dart';

class FeedStore = _FeedStore with _$FeedStore;

abstract class _FeedStore with Store {
  final Feed feed;

  @observable
  int unreadCount = 0;

  @observable
  DateTime lastUpdated;

  @observable
  ObservableList<Article> articles = ObservableList<Article>();

  _FeedStore(this.feed) : lastUpdated = feed.lastUpdated {
    unreadCount = feed.unreadCount;
    articles.addAll(feed.articles);
  }

  @action
  void incrementUnread() {
    unreadCount++;
    feed.unreadCount = unreadCount;
  }

  @action
  void decrementUnread() {
    if (unreadCount > 0) {
      unreadCount--;
      feed.unreadCount = unreadCount;
    }
  }

  @action
  void setUnreadCount(int count) {
    unreadCount = count;
    feed.unreadCount = count;
  }

  @action
  void updateLastUpdated(DateTime time) {
    lastUpdated = time;
    feed.lastUpdated = time;
  }

  @action
  void addArticle(Article article) {
    articles.add(article);
    feed.articles.add(article);
  }

  @action
  void removeArticle(Article article) {
    articles.remove(article);
    feed.articles.remove(article);
  }

  @action
  void setArticles(List<Article> newArticles) {
    articles.clear();
    articles.addAll(newArticles);
    feed.articles.clear();
    feed.articles.addAll(newArticles);
  }
}
