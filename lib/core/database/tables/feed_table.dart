import 'package:drift/drift.dart';

// 订阅源表定义
@DataClassName('FeedTableData')
class FeedTable extends Table {
  // 主键
  TextColumn get id => text()();
  // 标题
  TextColumn get title => text()();
  // RSS链接
  TextColumn get url => text()();
  // 图标链接
  TextColumn get iconUrl => text().nullable()();
  // 分类
  TextColumn get category => text()();
  // 未读数量
  IntColumn get unreadCount => integer().withDefault(const Constant(0))();
  // 最后更新时间
  DateTimeColumn get lastUpdated => dateTime()();

  @override
  Set<Column> get primaryKey => {id};

  @override
  List<String> get customConstraints => [
        'UNIQUE (url)',
      ];
}
