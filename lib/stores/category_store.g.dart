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
  ObservableList<Feed> get feeds {
    _$feedsAtom.reportRead();
    return super.feeds;
  }

  @override
  set feeds(ObservableList<Feed> value) {
    _$feedsAtom.reportWrite(value, super.feeds, () {
      super.feeds = value;
    });
  }

  late final _$_CategoryStoreActionController =
      ActionController(name: '_CategoryStore', context: context);

  @override
  void addFeed(Feed feed) {
    final _$actionInfo = _$_CategoryStoreActionController.startAction(
        name: '_CategoryStore.addFeed');
    try {
      return super.addFeed(feed);
    } finally {
      _$_CategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFeed(Feed feed) {
    final _$actionInfo = _$_CategoryStoreActionController.startAction(
        name: '_CategoryStore.removeFeed');
    try {
      return super.removeFeed(feed);
    } finally {
      _$_CategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFeeds(List<Feed> newFeeds) {
    final _$actionInfo = _$_CategoryStoreActionController.startAction(
        name: '_CategoryStore.setFeeds');
    try {
      return super.setFeeds(newFeeds);
    } finally {
      _$_CategoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
feeds: ${feeds},
totalUnread: ${totalUnread}
    ''';
  }
}
