import '../core/database/database.dart';

abstract class FeedRepository {
  Future<List<FeedTableData>> getAllFeeds();
  Future<FeedTableData?> getFeedById(String id);
  Future<void> insertFeed(FeedTableCompanion feed);
  Future<void> updateFeed(FeedTableCompanion feed);
  Future<void> deleteFeed(String id);
  Future<void> updateUnreadCount(String id, int count);
  Future<void> updateLastUpdated(String id, DateTime time);
}
