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

  // 添加测试数据
  Future<void> insertTestData() async {
    // 科技频道
    await insertFeed(FeedTableCompanion.insert(
      id: 'tech_1',
      title: '少数派',
      url: 'https://sspai.com/feed',
      category: '科技',
      lastUpdated: DateTime.now(),
      iconUrl: const Value(
          'https://cdn.sspai.com/sspai/assets/img/favicon/icon.ico'),
    ));

    await insertFeed(FeedTableCompanion.insert(
      id: 'tech_2',
      title: '36氪',
      url: 'https://36kr.com/feed',
      category: '科技',
      lastUpdated: DateTime.now(),
      iconUrl: const Value('https://36kr.com/favicon.ico'),
    ));

    // 新闻频道
    await insertFeed(FeedTableCompanion.insert(
      id: 'news_1',
      title: '澎湃新闻',
      url: 'https://thepaper.cn/rss',
      category: '新闻',
      lastUpdated: DateTime.now(),
      iconUrl: const Value('https://thepaper.cn/favicon.ico'),
    ));

    // 博客频道
    await insertFeed(FeedTableCompanion.insert(
      id: 'blog_1',
      title: '阮一峰的网络日志',
      url: 'http://www.ruanyifeng.com/blog/atom.xml',
      category: '博客',
      lastUpdated: DateTime.now(),
      iconUrl: const Value('http://www.ruanyifeng.com/favicon.ico'),
    ));
  }
}
