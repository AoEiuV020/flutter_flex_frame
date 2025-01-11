// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStore, Store {
  Computed<FeedTableData?>? _$selectedFeedComputed;

  @override
  FeedTableData? get selectedFeed => (_$selectedFeedComputed ??=
          Computed<FeedTableData?>(() => super.selectedFeed,
              name: '_AppStore.selectedFeed'))
      .value;
  Computed<ArticleTableData?>? _$selectedArticleComputed;

  @override
  ArticleTableData? get selectedArticle => (_$selectedArticleComputed ??=
          Computed<ArticleTableData?>(() => super.selectedArticle,
              name: '_AppStore.selectedArticle'))
      .value;
  Computed<List<ArticleTableData>>? _$currentArticlesComputed;

  @override
  List<ArticleTableData> get currentArticles => (_$currentArticlesComputed ??=
          Computed<List<ArticleTableData>>(() => super.currentArticles,
              name: '_AppStore.currentArticles'))
      .value;
  Computed<List<ArticleTableData>>? _$starredArticlesComputed;

  @override
  List<ArticleTableData> get starredArticles => (_$starredArticlesComputed ??=
          Computed<List<ArticleTableData>>(() => super.starredArticles,
              name: '_AppStore.starredArticles'))
      .value;
  Computed<int>? _$totalUnreadCountComputed;

  @override
  int get totalUnreadCount => (_$totalUnreadCountComputed ??= Computed<int>(
          () => super.totalUnreadCount,
          name: '_AppStore.totalUnreadCount'))
      .value;

  late final _$feedsAtom = Atom(name: '_AppStore.feeds', context: context);

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

  late final _$articlesAtom =
      Atom(name: '_AppStore.articles', context: context);

  @override
  ObservableList<ArticleTableData> get articles {
    _$articlesAtom.reportRead();
    return super.articles;
  }

  @override
  set articles(ObservableList<ArticleTableData> value) {
    _$articlesAtom.reportWrite(value, super.articles, () {
      super.articles = value;
    });
  }

  late final _$selectedFeedIdAtom =
      Atom(name: '_AppStore.selectedFeedId', context: context);

  @override
  String? get selectedFeedId {
    _$selectedFeedIdAtom.reportRead();
    return super.selectedFeedId;
  }

  @override
  set selectedFeedId(String? value) {
    _$selectedFeedIdAtom.reportWrite(value, super.selectedFeedId, () {
      super.selectedFeedId = value;
    });
  }

  late final _$selectedArticleIdAtom =
      Atom(name: '_AppStore.selectedArticleId', context: context);

  @override
  String? get selectedArticleId {
    _$selectedArticleIdAtom.reportRead();
    return super.selectedArticleId;
  }

  @override
  set selectedArticleId(String? value) {
    _$selectedArticleIdAtom.reportWrite(value, super.selectedArticleId, () {
      super.selectedArticleId = value;
    });
  }

  late final _$categoriesAtom =
      Atom(name: '_AppStore.categories', context: context);

  @override
  ObservableList<String> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<String> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$themeModeAtom =
      Atom(name: '_AppStore.themeMode', context: context);

  @override
  ThemeMode get themeMode {
    _$themeModeAtom.reportRead();
    return super.themeMode;
  }

  @override
  set themeMode(ThemeMode value) {
    _$themeModeAtom.reportWrite(value, super.themeMode, () {
      super.themeMode = value;
    });
  }

  late final _$localeAtom = Atom(name: '_AppStore.locale', context: context);

  @override
  Locale get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(Locale value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  late final _$fontSizeAtom =
      Atom(name: '_AppStore.fontSize', context: context);

  @override
  double get fontSize {
    _$fontSizeAtom.reportRead();
    return super.fontSize;
  }

  @override
  set fontSize(double value) {
    _$fontSizeAtom.reportWrite(value, super.fontSize, () {
      super.fontSize = value;
    });
  }

  late final _$loadFeedsAsyncAction =
      AsyncAction('_AppStore.loadFeeds', context: context);

  @override
  Future<void> loadFeeds() {
    return _$loadFeedsAsyncAction.run(() => super.loadFeeds());
  }

  late final _$loadArticlesAsyncAction =
      AsyncAction('_AppStore.loadArticles', context: context);

  @override
  Future<void> loadArticles(String? feedId) {
    return _$loadArticlesAsyncAction.run(() => super.loadArticles(feedId));
  }

  late final _$toggleArticleStarredAsyncAction =
      AsyncAction('_AppStore.toggleArticleStarred', context: context);

  @override
  Future<void> toggleArticleStarred(String articleId) {
    return _$toggleArticleStarredAsyncAction
        .run(() => super.toggleArticleStarred(articleId));
  }

  late final _$refreshAsyncAction =
      AsyncAction('_AppStore.refresh', context: context);

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  late final _$_updateCategoriesAsyncAction =
      AsyncAction('_AppStore._updateCategories', context: context);

  @override
  Future<void> _updateCategories() {
    return _$_updateCategoriesAsyncAction.run(() => super._updateCategories());
  }

  late final _$cleanupCacheAsyncAction =
      AsyncAction('_AppStore.cleanupCache', context: context);

  @override
  Future<void> cleanupCache() {
    return _$cleanupCacheAsyncAction.run(() => super.cleanupCache());
  }

  late final _$_AppStoreActionController =
      ActionController(name: '_AppStore', context: context);

  @override
  void selectFeed(String? feedId) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.selectFeed');
    try {
      return super.selectFeed(feedId);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectArticle(String? articleId) {
    final _$actionInfo = _$_AppStoreActionController.startAction(
        name: '_AppStore.selectArticle');
    try {
      return super.selectArticle(articleId);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setThemeMode(ThemeMode mode) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.setThemeMode');
    try {
      return super.setThemeMode(mode);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLocale(Locale newLocale) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.setLocale');
    try {
      return super.setLocale(newLocale);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFontSize(double size) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.setFontSize');
    try {
      return super.setFontSize(size);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategories(List<String> newCategories) {
    final _$actionInfo = _$_AppStoreActionController.startAction(
        name: '_AppStore.setCategories');
    try {
      return super.setCategories(newCategories);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
feeds: ${feeds},
articles: ${articles},
selectedFeedId: ${selectedFeedId},
selectedArticleId: ${selectedArticleId},
categories: ${categories},
themeMode: ${themeMode},
locale: ${locale},
fontSize: ${fontSize},
selectedFeed: ${selectedFeed},
selectedArticle: ${selectedArticle},
currentArticles: ${currentArticles},
starredArticles: ${starredArticles},
totalUnreadCount: ${totalUnreadCount}
    ''';
  }
}
