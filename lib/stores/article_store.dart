import 'package:mobx/mobx.dart';

import '../core/database/database.dart';
import '../repositories/article_repository.dart';

part 'article_store.g.dart';

class ArticleStore = _ArticleStore with _$ArticleStore;

abstract class _ArticleStore with Store {
  final ArticleTableData article;
  final ArticleRepository _repository;

  _ArticleStore(this.article, this._repository);

  @computed
  bool get isRead => article.isRead;

  @computed
  bool get isStarred => article.isStarred;

  @action
  Future<void> toggleRead() async {
    await _repository.markAsRead(article.id);
  }

  @action
  Future<void> toggleStarred() async {
    await _repository.toggleStarred(article.id);
  }
}
