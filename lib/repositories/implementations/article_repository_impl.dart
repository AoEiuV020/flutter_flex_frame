import 'package:drift/drift.dart';

import '../../core/database/database.dart';
import '../article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final AppDatabase _db;

  ArticleRepositoryImpl(this._db);

  @override
  Future<List<ArticleTableData>> getArticlesByFeed(String feedId) {
    return (_db.select(_db.articleTable)
          ..where((tbl) => tbl.feedId.equals(feedId))
          ..orderBy([(t) => OrderingTerm.desc(t.publishDate)]))
        .get();
  }

  @override
  Future<ArticleTableData?> getArticleById(String id) {
    return (_db.select(_db.articleTable)..where((tbl) => tbl.id.equals(id)))
        .getSingleOrNull();
  }

  @override
  Future<void> insertArticle(ArticleTableCompanion article) {
    return _db.into(_db.articleTable).insert(article);
  }

  @override
  Future<void> updateArticle(ArticleTableCompanion article) {
    return (_db.update(_db.articleTable)
          ..where((tbl) => tbl.id.equals(article.id.value)))
        .write(article);
  }

  @override
  Future<void> deleteArticle(String id) {
    return (_db.delete(_db.articleTable)..where((tbl) => tbl.id.equals(id)))
        .go();
  }

  @override
  Future<void> markAsRead(String id) {
    return (_db.update(_db.articleTable)..where((tbl) => tbl.id.equals(id)))
        .write(const ArticleTableCompanion(isRead: Value(true)));
  }

  @override
  Future<void> toggleStarred(String id) async {
    final article = await getArticleById(id);
    if (article != null) {
      await (_db.update(_db.articleTable)..where((tbl) => tbl.id.equals(id)))
          .write(ArticleTableCompanion(isStarred: Value(!article.isStarred)));
    }
  }

  @override
  Future<void> cleanupCache(Duration maxAge) async {
    final cutoff = DateTime.now().subtract(maxAge);
    await (_db.delete(_db.articleTable)
          ..where((tbl) => tbl.publishDate.isSmallerThanValue(cutoff))
          ..where((tbl) => tbl.isRead.equals(true))
          ..where((tbl) => tbl.isStarred.equals(false)))
        .go();
  }

  @override
  Future<List<ArticleTableData>> getAllArticles() async {
    return await (_db.select(_db.articleTable)
          ..orderBy([
            (t) => OrderingTerm(
                  expression: t.publishDate,
                  mode: OrderingMode.desc,
                ),
          ]))
        .get();
  }
}
