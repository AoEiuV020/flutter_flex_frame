import 'package:drift/drift.dart';

import 'feed_table.dart';

// 文章表定义
@DataClassName('ArticleTableData')
class ArticleTable extends Table {
  // 主键
  TextColumn get id => text()();
  // 关联的订阅源ID
  TextColumn get feedId => text().references(FeedTable, #id)();
  // 标题
  TextColumn get title => text()();
  // 内容
  TextColumn get content => text()();
  // 摘要
  TextColumn get summary => text().nullable()();
  // 作者
  TextColumn get author => text().nullable()();
  // 发布时间
  DateTimeColumn get publishDate => dateTime()();
  // 阅读状态
  BoolColumn get isRead => boolean().withDefault(const Constant(false))();
  // 收藏状态
  BoolColumn get isStarred => boolean().withDefault(const Constant(false))();
  // 原文链接
  TextColumn get url => text()();
  // 缓存时间
  DateTimeColumn get cacheUntil => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
        'UNIQUE (url)',
      ];
}
