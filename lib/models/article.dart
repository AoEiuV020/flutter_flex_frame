import 'package:mobx/mobx.dart';

part 'article.g.dart';

class Article = _Article with _$Article;

abstract class _Article with Store {
  final String id;
  final String feedId;
  final String title;
  final String content;
  final String? author;
  final DateTime publishDate;
  final String url;

  @observable
  bool isRead = false;

  @observable
  bool isStarred = false;

  _Article({
    required this.id,
    required this.feedId,
    required this.title,
    required this.content,
    // ignore: unused_element
    this.author,
    required this.publishDate,
    required this.url,
  });

  @action
  void toggleRead() => isRead = !isRead;

  @action
  void toggleStarred() => isStarred = !isStarred;

  @action
  void markRead() => isRead = true;

  @action
  void markUnread() => isRead = false;
}
