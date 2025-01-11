import 'package:drift/drift.dart';

import '../database/database.dart';

Future<List<FeedTableCompanion>> getMockFeedsData() async {
  return [
    FeedTableCompanion.insert(
      id: '1',
      title: 'Flutter News',
      url: 'https://flutter.dev/feed',
      iconUrl: const Value('https://flutter.dev/favicon.ico'),
      category: 'Technology',
      unreadCount: const Value(5),
      lastUpdated: DateTime.now(),
    ),
    FeedTableCompanion.insert(
      id: '2',
      title: 'Dart News',
      url: 'https://dart.dev/feed',
      iconUrl: const Value('https://dart.dev/favicon.ico'),
      category: 'Technology',
      unreadCount: const Value(3),
      lastUpdated: DateTime.now(),
    ),
  ];
}

Future<FeedTableCompanion?> getMockFeedData(String id) async {
  final feeds = await getMockFeedsData();
  return feeds.where((feed) => feed.id.value == id).firstOrNull;
}

Future<List<ArticleTableCompanion>> getMockArticlesData(String feedId) async {
  final now = DateTime.now();
  final cacheUntil = now.add(const Duration(days: 7));

  if (feedId == '1') {
    return [
      ArticleTableCompanion.insert(
        id: '1',
        feedId: feedId,
        title: 'Flutter 3.0 Released',
        content: 'Flutter 3.0 brings exciting new features...',
        summary: const Value('A summary of Flutter 3.0 release'),
        author: const Value('Flutter Team'),
        publishDate: now.subtract(const Duration(days: 1)),
        isRead: const Value(false),
        isStarred: const Value(false),
        url: 'https://flutter.dev/blog/flutter-3.0',
        cacheUntil: cacheUntil,
      ),
      ArticleTableCompanion.insert(
        id: '2',
        feedId: feedId,
        title: 'What\'s New in Flutter',
        content: 'Check out the latest updates in Flutter...',
        summary: const Value('Overview of new Flutter features'),
        author: const Value('Flutter Team'),
        publishDate: now.subtract(const Duration(days: 2)),
        isRead: const Value(false),
        isStarred: const Value(false),
        url: 'https://flutter.dev/blog/whats-new',
        cacheUntil: cacheUntil,
      ),
    ];
  } else if (feedId == '2') {
    return [
      ArticleTableCompanion.insert(
        id: '3',
        feedId: feedId,
        title: 'Dart 3.0 Released',
        content: 'Dart 3.0 introduces new language features...',
        summary: const Value('A summary of Dart 3.0 release'),
        author: const Value('Dart Team'),
        publishDate: now.subtract(const Duration(days: 1)),
        isRead: const Value(false),
        isStarred: const Value(false),
        url: 'https://dart.dev/blog/dart-3.0',
        cacheUntil: cacheUntil,
      ),
      ArticleTableCompanion.insert(
        id: '4',
        feedId: feedId,
        title: 'Dart Best Practices',
        content: 'Learn about Dart best practices...',
        summary: const Value('Overview of Dart best practices'),
        author: const Value('Dart Team'),
        publishDate: now.subtract(const Duration(days: 2)),
        isRead: const Value(false),
        isStarred: const Value(false),
        url: 'https://dart.dev/blog/best-practices',
        cacheUntil: cacheUntil,
      ),
    ];
  }

  return [];
}
