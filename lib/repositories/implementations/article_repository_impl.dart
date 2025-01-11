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

  Future<void> insertTestArticles() async {
    await insertArticle(ArticleTableCompanion.insert(
      id: 'sspai_1',
      feedId: 'tech_1',
      title: '派评 | 近期值得关注的 App',
      content: '本周值得关注的应用包括...',
      summary: const Value('编辑部为你挑选的近期好应用'),
      author: const Value('少数派编辑部'),
      publishDate: DateTime.now().subtract(const Duration(hours: 2)),
      url: 'https://sspai.com/post/12345',
      cacheUntil: DateTime.now().add(const Duration(days: 7)),
      isRead: const Value(false),
      isStarred: const Value(false),
    ));

    await insertArticle(ArticleTableCompanion.insert(
      id: 'sspai_2',
      feedId: 'tech_1',
      title: '如何提高工作效率：实用技巧分享',
      content: '提高工作效率的几个关键点...',
      summary: const Value('提升工作效率的实用指南'),
      author: const Value('张三'),
      publishDate: DateTime.now().subtract(const Duration(hours: 5)),
      url: 'https://sspai.com/post/12346',
      cacheUntil: DateTime.now().add(const Duration(days: 7)),
      isRead: const Value(false),
      isStarred: const Value(false),
    ));

    await insertArticle(ArticleTableCompanion.insert(
      id: '36kr_1',
      feedId: 'tech_2',
      title: '最新科技创业公司融资动态',
      content: '本周科技创业公司融资情况汇总...',
      summary: const Value('创业公司融资新闻'),
      author: const Value('36氪的小编'),
      publishDate: DateTime.now().subtract(const Duration(hours: 3)),
      url: 'https://36kr.com/p/12345',
      cacheUntil: DateTime.now().add(const Duration(days: 7)),
      isRead: const Value(false),
      isStarred: const Value(false),
    ));

    await insertArticle(ArticleTableCompanion.insert(
      id: 'thepaper_1',
      feedId: 'news_1',
      title: '今日要闻：重要新闻汇总',
      content: '今天发生的重要新闻包括...',
      summary: const Value('每日新闻汇总'),
      author: const Value('澎湃新闻'),
      publishDate: DateTime.now().subtract(const Duration(hours: 1)),
      url: 'https://thepaper.cn/newsDetail_12345',
      cacheUntil: DateTime.now().add(const Duration(days: 7)),
      isRead: const Value(false),
      isStarred: const Value(false),
    ));

    await insertArticle(ArticleTableCompanion.insert(
      id: 'ruanyf_1',
      feedId: 'blog_1',
      title: '科技爱好者周刊：第 xxx 期',
      content: '本周分享的主题是...',
      summary: const Value('每周科技动态分享'),
      author: const Value('阮一峰'),
      publishDate: DateTime.now().subtract(const Duration(days: 1)),
      url: 'http://www.ruanyifeng.com/blog/2024/xx/xx.html',
      cacheUntil: DateTime.now().add(const Duration(days: 7)),
      isRead: const Value(false),
      isStarred: const Value(false),
    ));
  }
}
