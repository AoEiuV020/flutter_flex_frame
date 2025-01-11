import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/article_table.dart';
import 'tables/feed_table.dart';

part 'database.gg.dart';

// 这个注解会触发代码生成
@DriftDatabase(
  tables: [
    FeedTable,
    ArticleTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // 未来版本升级时在这里处理数据库迁移
      },
    );
  }

  // Feed相关操作
  Future<List<FeedTableData>> getAllFeeds() => select(feedTable).get();

  Future<List<FeedTableData>> getFeedsByCategory(String category) =>
      (select(feedTable)..where((t) => t.category.equals(category))).get();

  Future<FeedTableData?> getFeedById(String id) async {
    final query = select(feedTable)..where((tbl) => tbl.id.equals(id));
    return query.getSingleOrNull();
  }

  Future<void> updateFeed(FeedTableCompanion feed) async {
    await update(feedTable).replace(feed);
  }

  Future<void> insertFeed(FeedTableCompanion feed) async {
    await into(feedTable).insert(feed);
  }

  Future<int> deleteFeed(String id) =>
      (delete(feedTable)..where((t) => t.id.equals(id))).go();

  // Article相关操作
  Future<List<ArticleTableData>> getArticlesByFeed(String feedId) =>
      (select(articleTable)..where((t) => t.feedId.equals(feedId))).get();

  Future<ArticleTableData?> getArticleById(String id) =>
      (select(articleTable)..where((t) => t.id.equals(id))).getSingleOrNull();

  Future<int> insertArticle(ArticleTableCompanion article) =>
      into(articleTable).insert(article);

  Future<bool> updateArticle(ArticleTableCompanion article) =>
      update(articleTable).replace(article);

  Future<int> deleteArticle(String id) =>
      (delete(articleTable)..where((t) => t.id.equals(id))).go();

  // 清理过期缓存
  Future<int> cleanExpiredCache() => (delete(articleTable)
        ..where((t) => t.cacheUntil.isSmallerThanValue(DateTime.now()))
        ..where((t) => t.isRead.equals(true))
        ..where((t) => t.isStarred.equals(false)))
      .go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'rss_reader.db'));
    return NativeDatabase.createInBackground(file);
  });
}
