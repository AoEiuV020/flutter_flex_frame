// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $FeedTableTable extends FeedTable
    with TableInfo<$FeedTableTable, FeedTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeedTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconUrlMeta =
      const VerificationMeta('iconUrl');
  @override
  late final GeneratedColumn<String> iconUrl = GeneratedColumn<String>(
      'icon_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unreadCountMeta =
      const VerificationMeta('unreadCount');
  @override
  late final GeneratedColumn<int> unreadCount = GeneratedColumn<int>(
      'unread_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, url, iconUrl, category, unreadCount, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'feed_table';
  @override
  VerificationContext validateIntegrity(Insertable<FeedTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('icon_url')) {
      context.handle(_iconUrlMeta,
          iconUrl.isAcceptableOrUnknown(data['icon_url']!, _iconUrlMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('unread_count')) {
      context.handle(
          _unreadCountMeta,
          unreadCount.isAcceptableOrUnknown(
              data['unread_count']!, _unreadCountMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeedTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeedTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      iconUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_url']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      unreadCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unread_count'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $FeedTableTable createAlias(String alias) {
    return $FeedTableTable(attachedDatabase, alias);
  }
}

class FeedTableData extends DataClass implements Insertable<FeedTableData> {
  final String id;
  final String title;
  final String url;
  final String? iconUrl;
  final String category;
  final int unreadCount;
  final DateTime lastUpdated;
  const FeedTableData(
      {required this.id,
      required this.title,
      required this.url,
      this.iconUrl,
      required this.category,
      required this.unreadCount,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || iconUrl != null) {
      map['icon_url'] = Variable<String>(iconUrl);
    }
    map['category'] = Variable<String>(category);
    map['unread_count'] = Variable<int>(unreadCount);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  FeedTableCompanion toCompanion(bool nullToAbsent) {
    return FeedTableCompanion(
      id: Value(id),
      title: Value(title),
      url: Value(url),
      iconUrl: iconUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(iconUrl),
      category: Value(category),
      unreadCount: Value(unreadCount),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory FeedTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeedTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      url: serializer.fromJson<String>(json['url']),
      iconUrl: serializer.fromJson<String?>(json['iconUrl']),
      category: serializer.fromJson<String>(json['category']),
      unreadCount: serializer.fromJson<int>(json['unreadCount']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'url': serializer.toJson<String>(url),
      'iconUrl': serializer.toJson<String?>(iconUrl),
      'category': serializer.toJson<String>(category),
      'unreadCount': serializer.toJson<int>(unreadCount),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  FeedTableData copyWith(
          {String? id,
          String? title,
          String? url,
          Value<String?> iconUrl = const Value.absent(),
          String? category,
          int? unreadCount,
          DateTime? lastUpdated}) =>
      FeedTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        iconUrl: iconUrl.present ? iconUrl.value : this.iconUrl,
        category: category ?? this.category,
        unreadCount: unreadCount ?? this.unreadCount,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  FeedTableData copyWithCompanion(FeedTableCompanion data) {
    return FeedTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      url: data.url.present ? data.url.value : this.url,
      iconUrl: data.iconUrl.present ? data.iconUrl.value : this.iconUrl,
      category: data.category.present ? data.category.value : this.category,
      unreadCount:
          data.unreadCount.present ? data.unreadCount.value : this.unreadCount,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FeedTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('category: $category, ')
          ..write('unreadCount: $unreadCount, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, url, iconUrl, category, unreadCount, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeedTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.url == this.url &&
          other.iconUrl == this.iconUrl &&
          other.category == this.category &&
          other.unreadCount == this.unreadCount &&
          other.lastUpdated == this.lastUpdated);
}

class FeedTableCompanion extends UpdateCompanion<FeedTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> url;
  final Value<String?> iconUrl;
  final Value<String> category;
  final Value<int> unreadCount;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const FeedTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.iconUrl = const Value.absent(),
    this.category = const Value.absent(),
    this.unreadCount = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FeedTableCompanion.insert({
    required String id,
    required String title,
    required String url,
    this.iconUrl = const Value.absent(),
    required String category,
    this.unreadCount = const Value.absent(),
    required DateTime lastUpdated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        url = Value(url),
        category = Value(category),
        lastUpdated = Value(lastUpdated);
  static Insertable<FeedTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? url,
    Expression<String>? iconUrl,
    Expression<String>? category,
    Expression<int>? unreadCount,
    Expression<DateTime>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (iconUrl != null) 'icon_url': iconUrl,
      if (category != null) 'category': category,
      if (unreadCount != null) 'unread_count': unreadCount,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FeedTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? url,
      Value<String?>? iconUrl,
      Value<String>? category,
      Value<int>? unreadCount,
      Value<DateTime>? lastUpdated,
      Value<int>? rowid}) {
    return FeedTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      iconUrl: iconUrl ?? this.iconUrl,
      category: category ?? this.category,
      unreadCount: unreadCount ?? this.unreadCount,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (iconUrl.present) {
      map['icon_url'] = Variable<String>(iconUrl.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (unreadCount.present) {
      map['unread_count'] = Variable<int>(unreadCount.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeedTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('category: $category, ')
          ..write('unreadCount: $unreadCount, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ArticleTableTable extends ArticleTable
    with TableInfo<$ArticleTableTable, ArticleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _feedIdMeta = const VerificationMeta('feedId');
  @override
  late final GeneratedColumn<String> feedId = GeneratedColumn<String>(
      'feed_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES feed_table (id)'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _summaryMeta =
      const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _publishDateMeta =
      const VerificationMeta('publishDate');
  @override
  late final GeneratedColumn<DateTime> publishDate = GeneratedColumn<DateTime>(
      'publish_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
      'is_read', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_read" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _isStarredMeta =
      const VerificationMeta('isStarred');
  @override
  late final GeneratedColumn<bool> isStarred = GeneratedColumn<bool>(
      'is_starred', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_starred" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _cacheUntilMeta =
      const VerificationMeta('cacheUntil');
  @override
  late final GeneratedColumn<DateTime> cacheUntil = GeneratedColumn<DateTime>(
      'cache_until', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        feedId,
        title,
        content,
        summary,
        author,
        publishDate,
        isRead,
        isStarred,
        url,
        cacheUntil
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'article_table';
  @override
  VerificationContext validateIntegrity(Insertable<ArticleTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('feed_id')) {
      context.handle(_feedIdMeta,
          feedId.isAcceptableOrUnknown(data['feed_id']!, _feedIdMeta));
    } else if (isInserting) {
      context.missing(_feedIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    }
    if (data.containsKey('publish_date')) {
      context.handle(
          _publishDateMeta,
          publishDate.isAcceptableOrUnknown(
              data['publish_date']!, _publishDateMeta));
    } else if (isInserting) {
      context.missing(_publishDateMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(_isReadMeta,
          isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta));
    }
    if (data.containsKey('is_starred')) {
      context.handle(_isStarredMeta,
          isStarred.isAcceptableOrUnknown(data['is_starred']!, _isStarredMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('cache_until')) {
      context.handle(
          _cacheUntilMeta,
          cacheUntil.isAcceptableOrUnknown(
              data['cache_until']!, _cacheUntilMeta));
    } else if (isInserting) {
      context.missing(_cacheUntilMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArticleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArticleTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      feedId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}feed_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary']),
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author']),
      publishDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}publish_date'])!,
      isRead: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_read'])!,
      isStarred: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_starred'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      cacheUntil: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}cache_until'])!,
    );
  }

  @override
  $ArticleTableTable createAlias(String alias) {
    return $ArticleTableTable(attachedDatabase, alias);
  }
}

class ArticleTableData extends DataClass
    implements Insertable<ArticleTableData> {
  final String id;
  final String feedId;
  final String title;
  final String content;
  final String? summary;
  final String? author;
  final DateTime publishDate;
  final bool isRead;
  final bool isStarred;
  final String url;
  final DateTime cacheUntil;
  const ArticleTableData(
      {required this.id,
      required this.feedId,
      required this.title,
      required this.content,
      this.summary,
      this.author,
      required this.publishDate,
      required this.isRead,
      required this.isStarred,
      required this.url,
      required this.cacheUntil});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['feed_id'] = Variable<String>(feedId);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    map['publish_date'] = Variable<DateTime>(publishDate);
    map['is_read'] = Variable<bool>(isRead);
    map['is_starred'] = Variable<bool>(isStarred);
    map['url'] = Variable<String>(url);
    map['cache_until'] = Variable<DateTime>(cacheUntil);
    return map;
  }

  ArticleTableCompanion toCompanion(bool nullToAbsent) {
    return ArticleTableCompanion(
      id: Value(id),
      feedId: Value(feedId),
      title: Value(title),
      content: Value(content),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
      author:
          author == null && nullToAbsent ? const Value.absent() : Value(author),
      publishDate: Value(publishDate),
      isRead: Value(isRead),
      isStarred: Value(isStarred),
      url: Value(url),
      cacheUntil: Value(cacheUntil),
    );
  }

  factory ArticleTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArticleTableData(
      id: serializer.fromJson<String>(json['id']),
      feedId: serializer.fromJson<String>(json['feedId']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      summary: serializer.fromJson<String?>(json['summary']),
      author: serializer.fromJson<String?>(json['author']),
      publishDate: serializer.fromJson<DateTime>(json['publishDate']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      isStarred: serializer.fromJson<bool>(json['isStarred']),
      url: serializer.fromJson<String>(json['url']),
      cacheUntil: serializer.fromJson<DateTime>(json['cacheUntil']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'feedId': serializer.toJson<String>(feedId),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'summary': serializer.toJson<String?>(summary),
      'author': serializer.toJson<String?>(author),
      'publishDate': serializer.toJson<DateTime>(publishDate),
      'isRead': serializer.toJson<bool>(isRead),
      'isStarred': serializer.toJson<bool>(isStarred),
      'url': serializer.toJson<String>(url),
      'cacheUntil': serializer.toJson<DateTime>(cacheUntil),
    };
  }

  ArticleTableData copyWith(
          {String? id,
          String? feedId,
          String? title,
          String? content,
          Value<String?> summary = const Value.absent(),
          Value<String?> author = const Value.absent(),
          DateTime? publishDate,
          bool? isRead,
          bool? isStarred,
          String? url,
          DateTime? cacheUntil}) =>
      ArticleTableData(
        id: id ?? this.id,
        feedId: feedId ?? this.feedId,
        title: title ?? this.title,
        content: content ?? this.content,
        summary: summary.present ? summary.value : this.summary,
        author: author.present ? author.value : this.author,
        publishDate: publishDate ?? this.publishDate,
        isRead: isRead ?? this.isRead,
        isStarred: isStarred ?? this.isStarred,
        url: url ?? this.url,
        cacheUntil: cacheUntil ?? this.cacheUntil,
      );
  ArticleTableData copyWithCompanion(ArticleTableCompanion data) {
    return ArticleTableData(
      id: data.id.present ? data.id.value : this.id,
      feedId: data.feedId.present ? data.feedId.value : this.feedId,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      summary: data.summary.present ? data.summary.value : this.summary,
      author: data.author.present ? data.author.value : this.author,
      publishDate:
          data.publishDate.present ? data.publishDate.value : this.publishDate,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      isStarred: data.isStarred.present ? data.isStarred.value : this.isStarred,
      url: data.url.present ? data.url.value : this.url,
      cacheUntil:
          data.cacheUntil.present ? data.cacheUntil.value : this.cacheUntil,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ArticleTableData(')
          ..write('id: $id, ')
          ..write('feedId: $feedId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('summary: $summary, ')
          ..write('author: $author, ')
          ..write('publishDate: $publishDate, ')
          ..write('isRead: $isRead, ')
          ..write('isStarred: $isStarred, ')
          ..write('url: $url, ')
          ..write('cacheUntil: $cacheUntil')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, feedId, title, content, summary, author,
      publishDate, isRead, isStarred, url, cacheUntil);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleTableData &&
          other.id == this.id &&
          other.feedId == this.feedId &&
          other.title == this.title &&
          other.content == this.content &&
          other.summary == this.summary &&
          other.author == this.author &&
          other.publishDate == this.publishDate &&
          other.isRead == this.isRead &&
          other.isStarred == this.isStarred &&
          other.url == this.url &&
          other.cacheUntil == this.cacheUntil);
}

class ArticleTableCompanion extends UpdateCompanion<ArticleTableData> {
  final Value<String> id;
  final Value<String> feedId;
  final Value<String> title;
  final Value<String> content;
  final Value<String?> summary;
  final Value<String?> author;
  final Value<DateTime> publishDate;
  final Value<bool> isRead;
  final Value<bool> isStarred;
  final Value<String> url;
  final Value<DateTime> cacheUntil;
  final Value<int> rowid;
  const ArticleTableCompanion({
    this.id = const Value.absent(),
    this.feedId = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.summary = const Value.absent(),
    this.author = const Value.absent(),
    this.publishDate = const Value.absent(),
    this.isRead = const Value.absent(),
    this.isStarred = const Value.absent(),
    this.url = const Value.absent(),
    this.cacheUntil = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ArticleTableCompanion.insert({
    required String id,
    required String feedId,
    required String title,
    required String content,
    this.summary = const Value.absent(),
    this.author = const Value.absent(),
    required DateTime publishDate,
    this.isRead = const Value.absent(),
    this.isStarred = const Value.absent(),
    required String url,
    required DateTime cacheUntil,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        feedId = Value(feedId),
        title = Value(title),
        content = Value(content),
        publishDate = Value(publishDate),
        url = Value(url),
        cacheUntil = Value(cacheUntil);
  static Insertable<ArticleTableData> custom({
    Expression<String>? id,
    Expression<String>? feedId,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? summary,
    Expression<String>? author,
    Expression<DateTime>? publishDate,
    Expression<bool>? isRead,
    Expression<bool>? isStarred,
    Expression<String>? url,
    Expression<DateTime>? cacheUntil,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (feedId != null) 'feed_id': feedId,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (summary != null) 'summary': summary,
      if (author != null) 'author': author,
      if (publishDate != null) 'publish_date': publishDate,
      if (isRead != null) 'is_read': isRead,
      if (isStarred != null) 'is_starred': isStarred,
      if (url != null) 'url': url,
      if (cacheUntil != null) 'cache_until': cacheUntil,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ArticleTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? feedId,
      Value<String>? title,
      Value<String>? content,
      Value<String?>? summary,
      Value<String?>? author,
      Value<DateTime>? publishDate,
      Value<bool>? isRead,
      Value<bool>? isStarred,
      Value<String>? url,
      Value<DateTime>? cacheUntil,
      Value<int>? rowid}) {
    return ArticleTableCompanion(
      id: id ?? this.id,
      feedId: feedId ?? this.feedId,
      title: title ?? this.title,
      content: content ?? this.content,
      summary: summary ?? this.summary,
      author: author ?? this.author,
      publishDate: publishDate ?? this.publishDate,
      isRead: isRead ?? this.isRead,
      isStarred: isStarred ?? this.isStarred,
      url: url ?? this.url,
      cacheUntil: cacheUntil ?? this.cacheUntil,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (feedId.present) {
      map['feed_id'] = Variable<String>(feedId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (publishDate.present) {
      map['publish_date'] = Variable<DateTime>(publishDate.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (isStarred.present) {
      map['is_starred'] = Variable<bool>(isStarred.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (cacheUntil.present) {
      map['cache_until'] = Variable<DateTime>(cacheUntil.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticleTableCompanion(')
          ..write('id: $id, ')
          ..write('feedId: $feedId, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('summary: $summary, ')
          ..write('author: $author, ')
          ..write('publishDate: $publishDate, ')
          ..write('isRead: $isRead, ')
          ..write('isStarred: $isStarred, ')
          ..write('url: $url, ')
          ..write('cacheUntil: $cacheUntil, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FeedTableTable feedTable = $FeedTableTable(this);
  late final $ArticleTableTable articleTable = $ArticleTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [feedTable, articleTable];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$FeedTableTableCreateCompanionBuilder = FeedTableCompanion Function({
  required String id,
  required String title,
  required String url,
  Value<String?> iconUrl,
  required String category,
  Value<int> unreadCount,
  required DateTime lastUpdated,
  Value<int> rowid,
});
typedef $$FeedTableTableUpdateCompanionBuilder = FeedTableCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> url,
  Value<String?> iconUrl,
  Value<String> category,
  Value<int> unreadCount,
  Value<DateTime> lastUpdated,
  Value<int> rowid,
});

final class $$FeedTableTableReferences
    extends BaseReferences<_$AppDatabase, $FeedTableTable, FeedTableData> {
  $$FeedTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ArticleTableTable, List<ArticleTableData>>
      _articleTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.articleTable,
          aliasName:
              $_aliasNameGenerator(db.feedTable.id, db.articleTable.feedId));

  $$ArticleTableTableProcessedTableManager get articleTableRefs {
    final manager = $$ArticleTableTableTableManager($_db, $_db.articleTable)
        .filter((f) => f.feedId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_articleTableRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$FeedTableTableFilterComposer
    extends Composer<_$AppDatabase, $FeedTableTable> {
  $$FeedTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconUrl => $composableBuilder(
      column: $table.iconUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get unreadCount => $composableBuilder(
      column: $table.unreadCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));

  Expression<bool> articleTableRefs(
      Expression<bool> Function($$ArticleTableTableFilterComposer f) f) {
    final $$ArticleTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articleTable,
        getReferencedColumn: (t) => t.feedId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticleTableTableFilterComposer(
              $db: $db,
              $table: $db.articleTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$FeedTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FeedTableTable> {
  $$FeedTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconUrl => $composableBuilder(
      column: $table.iconUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get unreadCount => $composableBuilder(
      column: $table.unreadCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$FeedTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeedTableTable> {
  $$FeedTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get iconUrl =>
      $composableBuilder(column: $table.iconUrl, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get unreadCount => $composableBuilder(
      column: $table.unreadCount, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);

  Expression<T> articleTableRefs<T extends Object>(
      Expression<T> Function($$ArticleTableTableAnnotationComposer a) f) {
    final $$ArticleTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.articleTable,
        getReferencedColumn: (t) => t.feedId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ArticleTableTableAnnotationComposer(
              $db: $db,
              $table: $db.articleTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$FeedTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeedTableTable,
    FeedTableData,
    $$FeedTableTableFilterComposer,
    $$FeedTableTableOrderingComposer,
    $$FeedTableTableAnnotationComposer,
    $$FeedTableTableCreateCompanionBuilder,
    $$FeedTableTableUpdateCompanionBuilder,
    (FeedTableData, $$FeedTableTableReferences),
    FeedTableData,
    PrefetchHooks Function({bool articleTableRefs})> {
  $$FeedTableTableTableManager(_$AppDatabase db, $FeedTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeedTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeedTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeedTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String?> iconUrl = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<int> unreadCount = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FeedTableCompanion(
            id: id,
            title: title,
            url: url,
            iconUrl: iconUrl,
            category: category,
            unreadCount: unreadCount,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String url,
            Value<String?> iconUrl = const Value.absent(),
            required String category,
            Value<int> unreadCount = const Value.absent(),
            required DateTime lastUpdated,
            Value<int> rowid = const Value.absent(),
          }) =>
              FeedTableCompanion.insert(
            id: id,
            title: title,
            url: url,
            iconUrl: iconUrl,
            category: category,
            unreadCount: unreadCount,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$FeedTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({articleTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (articleTableRefs) db.articleTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (articleTableRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$FeedTableTableReferences
                            ._articleTableRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$FeedTableTableReferences(db, table, p0)
                                .articleTableRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.feedId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$FeedTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FeedTableTable,
    FeedTableData,
    $$FeedTableTableFilterComposer,
    $$FeedTableTableOrderingComposer,
    $$FeedTableTableAnnotationComposer,
    $$FeedTableTableCreateCompanionBuilder,
    $$FeedTableTableUpdateCompanionBuilder,
    (FeedTableData, $$FeedTableTableReferences),
    FeedTableData,
    PrefetchHooks Function({bool articleTableRefs})>;
typedef $$ArticleTableTableCreateCompanionBuilder = ArticleTableCompanion
    Function({
  required String id,
  required String feedId,
  required String title,
  required String content,
  Value<String?> summary,
  Value<String?> author,
  required DateTime publishDate,
  Value<bool> isRead,
  Value<bool> isStarred,
  required String url,
  required DateTime cacheUntil,
  Value<int> rowid,
});
typedef $$ArticleTableTableUpdateCompanionBuilder = ArticleTableCompanion
    Function({
  Value<String> id,
  Value<String> feedId,
  Value<String> title,
  Value<String> content,
  Value<String?> summary,
  Value<String?> author,
  Value<DateTime> publishDate,
  Value<bool> isRead,
  Value<bool> isStarred,
  Value<String> url,
  Value<DateTime> cacheUntil,
  Value<int> rowid,
});

final class $$ArticleTableTableReferences extends BaseReferences<_$AppDatabase,
    $ArticleTableTable, ArticleTableData> {
  $$ArticleTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FeedTableTable _feedIdTable(_$AppDatabase db) =>
      db.feedTable.createAlias(
          $_aliasNameGenerator(db.articleTable.feedId, db.feedTable.id));

  $$FeedTableTableProcessedTableManager get feedId {
    final manager = $$FeedTableTableTableManager($_db, $_db.feedTable)
        .filter((f) => f.id($_item.feedId));
    final item = $_typedResult.readTableOrNull(_feedIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ArticleTableTableFilterComposer
    extends Composer<_$AppDatabase, $ArticleTableTable> {
  $$ArticleTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get publishDate => $composableBuilder(
      column: $table.publishDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isStarred => $composableBuilder(
      column: $table.isStarred, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get cacheUntil => $composableBuilder(
      column: $table.cacheUntil, builder: (column) => ColumnFilters(column));

  $$FeedTableTableFilterComposer get feedId {
    final $$FeedTableTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.feedId,
        referencedTable: $db.feedTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FeedTableTableFilterComposer(
              $db: $db,
              $table: $db.feedTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ArticleTableTable> {
  $$ArticleTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get author => $composableBuilder(
      column: $table.author, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get publishDate => $composableBuilder(
      column: $table.publishDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRead => $composableBuilder(
      column: $table.isRead, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isStarred => $composableBuilder(
      column: $table.isStarred, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get cacheUntil => $composableBuilder(
      column: $table.cacheUntil, builder: (column) => ColumnOrderings(column));

  $$FeedTableTableOrderingComposer get feedId {
    final $$FeedTableTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.feedId,
        referencedTable: $db.feedTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FeedTableTableOrderingComposer(
              $db: $db,
              $table: $db.feedTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ArticleTableTable> {
  $$ArticleTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<DateTime> get publishDate => $composableBuilder(
      column: $table.publishDate, builder: (column) => column);

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  GeneratedColumn<bool> get isStarred =>
      $composableBuilder(column: $table.isStarred, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<DateTime> get cacheUntil => $composableBuilder(
      column: $table.cacheUntil, builder: (column) => column);

  $$FeedTableTableAnnotationComposer get feedId {
    final $$FeedTableTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.feedId,
        referencedTable: $db.feedTable,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FeedTableTableAnnotationComposer(
              $db: $db,
              $table: $db.feedTable,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ArticleTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ArticleTableTable,
    ArticleTableData,
    $$ArticleTableTableFilterComposer,
    $$ArticleTableTableOrderingComposer,
    $$ArticleTableTableAnnotationComposer,
    $$ArticleTableTableCreateCompanionBuilder,
    $$ArticleTableTableUpdateCompanionBuilder,
    (ArticleTableData, $$ArticleTableTableReferences),
    ArticleTableData,
    PrefetchHooks Function({bool feedId})> {
  $$ArticleTableTableTableManager(_$AppDatabase db, $ArticleTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ArticleTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ArticleTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ArticleTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> feedId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<String?> summary = const Value.absent(),
            Value<String?> author = const Value.absent(),
            Value<DateTime> publishDate = const Value.absent(),
            Value<bool> isRead = const Value.absent(),
            Value<bool> isStarred = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<DateTime> cacheUntil = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ArticleTableCompanion(
            id: id,
            feedId: feedId,
            title: title,
            content: content,
            summary: summary,
            author: author,
            publishDate: publishDate,
            isRead: isRead,
            isStarred: isStarred,
            url: url,
            cacheUntil: cacheUntil,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String feedId,
            required String title,
            required String content,
            Value<String?> summary = const Value.absent(),
            Value<String?> author = const Value.absent(),
            required DateTime publishDate,
            Value<bool> isRead = const Value.absent(),
            Value<bool> isStarred = const Value.absent(),
            required String url,
            required DateTime cacheUntil,
            Value<int> rowid = const Value.absent(),
          }) =>
              ArticleTableCompanion.insert(
            id: id,
            feedId: feedId,
            title: title,
            content: content,
            summary: summary,
            author: author,
            publishDate: publishDate,
            isRead: isRead,
            isStarred: isStarred,
            url: url,
            cacheUntil: cacheUntil,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ArticleTableTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({feedId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (feedId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.feedId,
                    referencedTable:
                        $$ArticleTableTableReferences._feedIdTable(db),
                    referencedColumn:
                        $$ArticleTableTableReferences._feedIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ArticleTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ArticleTableTable,
    ArticleTableData,
    $$ArticleTableTableFilterComposer,
    $$ArticleTableTableOrderingComposer,
    $$ArticleTableTableAnnotationComposer,
    $$ArticleTableTableCreateCompanionBuilder,
    $$ArticleTableTableUpdateCompanionBuilder,
    (ArticleTableData, $$ArticleTableTableReferences),
    ArticleTableData,
    PrefetchHooks Function({bool feedId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FeedTableTableTableManager get feedTable =>
      $$FeedTableTableTableManager(_db, _db.feedTable);
  $$ArticleTableTableTableManager get articleTable =>
      $$ArticleTableTableTableManager(_db, _db.articleTable);
}
