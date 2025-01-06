class Article {
  final String id;
  final String feedId;
  final String title;
  final String content;
  final String? author;
  final DateTime publishDate;
  final String url;
  bool isRead;
  bool isStarred;

  Article({
    required this.id,
    required this.feedId,
    required this.title,
    required this.content,
    this.author,
    required this.publishDate,
    required this.url,
    this.isRead = false,
    this.isStarred = false,
  });
}
