import '../core/database/database.dart';

abstract class ArticleRepository {
  Future<List<ArticleTableData>> getArticlesByFeed(String feedId);
  Future<ArticleTableData?> getArticleById(String id);
  Future<void> insertArticle(ArticleTableCompanion article);
  Future<void> updateArticle(ArticleTableCompanion article);
  Future<void> deleteArticle(String id);
  Future<void> markAsRead(String id);
  Future<void> toggleStarred(String id);
  Future<void> cleanupCache(Duration maxAge);
}
