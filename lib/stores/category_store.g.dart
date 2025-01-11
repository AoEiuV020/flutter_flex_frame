// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryStore on _CategoryStore, Store {
  Computed<int>? _$totalUnreadComputed;

  @override
  int get totalUnread =>
      (_$totalUnreadComputed ??= Computed<int>(() => super.totalUnread,
              name: '_CategoryStore.totalUnread'))
          .value;

  late final _$feedsAtom = Atom(name: '_CategoryStore.feeds', context: context);

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
      Atom(name: '_CategoryStore.isLoading', context: context);

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
      AsyncAction('_CategoryStore.loadFeeds', context: context);

  @override
  Future<void> loadFeeds(String categoryId) {
    return _$loadFeedsAsyncAction.run(() => super.loadFeeds(categoryId));
  }

  late final _$addFeedAsyncAction =
      AsyncAction('_CategoryStore.addFeed', context: context);

  @override
  Future<void> addFeed(FeedTableCompanion feed) {
    return _$addFeedAsyncAction.run(() => super.addFeed(feed));
  }

  late final _$removeFeedAsyncAction =
      AsyncAction('_CategoryStore.removeFeed', context: context);

  @override
  Future<void> removeFeed(String id, String categoryId) {
    return _$removeFeedAsyncAction.run(() => super.removeFeed(id, categoryId));
  }

  @override
  String toString() {
    return '''
feeds: ${feeds},
isLoading: ${isLoading},
totalUnread: ${totalUnread}
    ''';
  }
}
