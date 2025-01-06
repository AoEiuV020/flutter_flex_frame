import 'article.dart';

class Feed {
  final String id;
  final String title;
  final String url;
  final String? iconUrl;
  final String category;
  int unreadCount;
  DateTime lastUpdated;
  List<Article> articles;

  Feed({
    required this.id,
    required this.title,
    required this.url,
    this.iconUrl,
    required this.category,
    required this.lastUpdated,
    this.unreadCount = 0,
    List<Article>? articles,
  }) : articles = articles ?? [];
}
