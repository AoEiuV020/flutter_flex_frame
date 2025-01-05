// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Feed on _Feed, Store {
  late final _$unreadCountAtom =
      Atom(name: '_Feed.unreadCount', context: context);

  @override
  int get unreadCount {
    _$unreadCountAtom.reportRead();
    return super.unreadCount;
  }

  @override
  set unreadCount(int value) {
    _$unreadCountAtom.reportWrite(value, super.unreadCount, () {
      super.unreadCount = value;
    });
  }

  late final _$lastUpdatedAtom =
      Atom(name: '_Feed.lastUpdated', context: context);

  @override
  DateTime get lastUpdated {
    _$lastUpdatedAtom.reportRead();
    return super.lastUpdated;
  }

  @override
  set lastUpdated(DateTime value) {
    _$lastUpdatedAtom.reportWrite(value, super.lastUpdated, () {
      super.lastUpdated = value;
    });
  }

  late final _$articlesAtom = Atom(name: '_Feed.articles', context: context);

  @override
  ObservableList<Article> get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(ObservableList<Article> value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  late final _$_FeedActionController =
      ActionController(name: '_Feed', context: context);

  @override
  void incrementUnread() {
    final _$actionInfo =
        _$_FeedActionController.startAction(name: '_Feed.incrementUnread');
    try {
      return super.incrementUnread();
    } finally {
      _$_FeedActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementUnread() {
    final _$actionInfo =
        _$_FeedActionController.startAction(name: '_Feed.decrementUnread');
    try {
      return super.decrementUnread();
    } finally {
      _$_FeedActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUnreadCount(int count) {
    final _$actionInfo =
        _$_FeedActionController.startAction(name: '_Feed.setUnreadCount');
    try {
      return super.setUnreadCount(count);
    } finally {
      _$_FeedActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateLastUpdated(DateTime time) {
    final _$actionInfo =
        _$_FeedActionController.startAction(name: '_Feed.updateLastUpdated');
    try {
      return super.updateLastUpdated(time);
    } finally {
      _$_FeedActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addArticle(Article article) {
    final _$actionInfo =
        _$_FeedActionController.startAction(name: '_Feed.addArticle');
    try {
      return super.addArticle(article);
    } finally {
      _$_FeedActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeArticle(Article article) {
    final _$actionInfo =
        _$_FeedActionController.startAction(name: '_Feed.removeArticle');
    try {
      return super.removeArticle(article);
    } finally {
      _$_FeedActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setArticles(List<Article> newArticles) {
    final _$actionInfo =
        _$_FeedActionController.startAction(name: '_Feed.setArticles');
    try {
      return super.setArticles(newArticles);
    } finally {
      _$_FeedActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
unreadCount: ${unreadCount},
lastUpdated: ${lastUpdated},
articles: ${articles}
    ''';
  }
}
