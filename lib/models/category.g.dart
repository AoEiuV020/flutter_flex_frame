// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Category on _Category, Store {
  Computed<int>? _$totalUnreadComputed;

  @override
  int get totalUnread => (_$totalUnreadComputed ??=
          Computed<int>(() => super.totalUnread, name: '_Category.totalUnread'))
      .value;

  late final _$feedsAtom = Atom(name: '_Category.feeds', context: context);

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

  late final _$_CategoryActionController =
      ActionController(name: '_Category', context: context);

  @override
  void addFeed(Feed feed) {
    final _$actionInfo =
        _$_CategoryActionController.startAction(name: '_Category.addFeed');
    try {
      return super.addFeed(feed);
    } finally {
      _$_CategoryActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFeed(Feed feed) {
    final _$actionInfo =
        _$_CategoryActionController.startAction(name: '_Category.removeFeed');
    try {
      return super.removeFeed(feed);
    } finally {
      _$_CategoryActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFeeds(List<Feed> newFeeds) {
    final _$actionInfo =
        _$_CategoryActionController.startAction(name: '_Category.setFeeds');
    try {
      return super.setFeeds(newFeeds);
    } finally {
      _$_CategoryActionController.endAction(_$actionInfo);
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
