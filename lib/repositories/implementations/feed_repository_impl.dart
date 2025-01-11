import 'package:drift/drift.dart';

import '../../core/database/database.dart';
import '../feed_repository.dart';

class FeedRepositoryImpl implements FeedRepository {
  final AppDatabase _db;

  FeedRepositoryImpl(this._db);

  @override
  Future<List<FeedTableData>> getAllFeeds() {
    return _db.select(_db.feedTable).get();
  }

  @override
  Future<FeedTableData?> getFeedById(String id) {
    return (_db.select(_db.feedTable)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  @override
  Future<void> insertFeed(FeedTableCompanion feed) {
    return _db.into(_db.feedTable).insert(feed);
  }

  @override
  Future<void> updateFeed(FeedTableCompanion feed) {
    return (_db.update(_db.feedTable)
          ..where((tbl) => tbl.id.equals(feed.id.value)))
        .write(feed);
  }

  @override
  Future<void> deleteFeed(String id) {
    return (_db.delete(_db.feedTable)..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<void> updateUnreadCount(String id, int count) {
    return (_db.update(_db.feedTable)..where((tbl) => tbl.id.equals(id)))
        .write(FeedTableCompanion(unreadCount: Value(count)));
  }

  @override
  Future<void> updateLastUpdated(String id, DateTime time) {
    return (_db.update(_db.feedTable)..where((tbl) => tbl.id.equals(id)))
        .write(FeedTableCompanion(lastUpdated: Value(time)));
  }
}
