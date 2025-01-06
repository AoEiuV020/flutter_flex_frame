import 'package:mobx/mobx.dart';

import '../models/article.dart';

part 'article_store.g.dart';

class ArticleStore = _ArticleStore with _$ArticleStore;

abstract class _ArticleStore with Store {
  final Article article;

  @observable
  bool isRead = false;

  @observable
  bool isStarred = false;

  _ArticleStore(this.article) {
    isRead = article.isRead;
    isStarred = article.isStarred;
  }

  @action
  void toggleRead() {
    isRead = !isRead;
    article.isRead = isRead;
  }

  @action
  void toggleStarred() {
    isStarred = !isStarred;
    article.isStarred = isStarred;
  }

  @action
  void markRead() {
    isRead = true;
    article.isRead = true;
  }

  @action
  void markUnread() {
    isRead = false;
    article.isRead = false;
  }
}
