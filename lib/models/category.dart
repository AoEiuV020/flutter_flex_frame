import 'feed.dart';

class Category {
  final String id;
  final String name;
  List<Feed> feeds;

  Category({
    required this.id,
    required this.name,
    List<Feed>? feeds,
  }) : feeds = feeds ?? [];

  int get totalUnread => feeds.fold(0, (sum, feed) => sum + feed.unreadCount);
}
