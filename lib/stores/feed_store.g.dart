// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FeedStore on _FeedStore, Store {
  late final _$feedsAtom = Atom(name: '_FeedStore.feeds', context: context);

  @override
  ObservableList<FeedTableData> get feeds {
    _$feedsAtom.reportRead();
    return super.feeds;
  }

  @override
  set feeds(ObservableList<FeedTableData> value) {
    _$feedsAtom.reportWrite(value, super.feeds, () {
      super.feeds = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_FeedStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadFeedsAsyncAction =
      AsyncAction('_FeedStore.loadFeeds', context: context);

  @override
  Future<void> loadFeeds() {
    return _$loadFeedsAsyncAction.run(() => super.loadFeeds());
  }

  late final _$addFeedAsyncAction =
      AsyncAction('_FeedStore.addFeed', context: context);

  @override
  Future<void> addFeed(FeedTableCompanion feed) {
    return _$addFeedAsyncAction.run(() => super.addFeed(feed));
  }

  late final _$updateFeedAsyncAction =
      AsyncAction('_FeedStore.updateFeed', context: context);

  @override
  Future<void> updateFeed(FeedTableCompanion feed) {
    return _$updateFeedAsyncAction.run(() => super.updateFeed(feed));
  }

  late final _$deleteFeedAsyncAction =
      AsyncAction('_FeedStore.deleteFeed', context: context);

  @override
  Future<void> deleteFeed(String id) {
    return _$deleteFeedAsyncAction.run(() => super.deleteFeed(id));
  }

  late final _$updateUnreadCountAsyncAction =
      AsyncAction('_FeedStore.updateUnreadCount', context: context);

  @override
  Future<void> updateUnreadCount(String feedId, int count) {
    return _$updateUnreadCountAsyncAction
        .run(() => super.updateUnreadCount(feedId, count));
  }

  @override
  String toString() {
    return '''
feeds: ${feeds},
isLoading: ${isLoading}
    ''';
  }
}
