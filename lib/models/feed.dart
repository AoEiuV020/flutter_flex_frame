import '../core/database/database.dart';

class Feed {
  final String id;
  final String title;
  final String url;
  final String category;
  final String? iconUrl;
  final int unreadCount;
  final DateTime lastUpdated;

  const Feed({
    required this.id,
    required this.title,
    required this.url,
    required this.category,
    this.iconUrl,
    this.unreadCount = 0,
    required this.lastUpdated,
  });

  factory Feed.fromTableData(FeedTableData data) {
    return Feed(
      id: data.id,
      title: data.title,
      url: data.url,
      category: data.category,
      iconUrl: data.iconUrl,
      unreadCount: data.unreadCount,
      lastUpdated: data.lastUpdated,
    );
  }
}
