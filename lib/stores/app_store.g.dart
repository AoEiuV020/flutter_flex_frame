// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppStore on _AppStore, Store {
  Computed<List<Feed>>? _$allFeedsComputed;

  @override
  List<Feed> get allFeeds =>
      (_$allFeedsComputed ??= Computed<List<Feed>>(() => super.allFeeds,
              name: '_AppStore.allFeeds'))
          .value;
  Computed<List<Article>>? _$allArticlesComputed;

  @override
  List<Article> get allArticles => (_$allArticlesComputed ??=
          Computed<List<Article>>(() => super.allArticles,
              name: '_AppStore.allArticles'))
      .value;
  Computed<List<Article>>? _$currentArticlesComputed;

  @override
  List<Article> get currentArticles => (_$currentArticlesComputed ??=
          Computed<List<Article>>(() => super.currentArticles,
              name: '_AppStore.currentArticles'))
      .value;
  Computed<List<Article>>? _$starredArticlesComputed;

  @override
  List<Article> get starredArticles => (_$starredArticlesComputed ??=
          Computed<List<Article>>(() => super.starredArticles,
              name: '_AppStore.starredArticles'))
      .value;
  Computed<int>? _$totalUnreadCountComputed;

  @override
  int get totalUnreadCount => (_$totalUnreadCountComputed ??= Computed<int>(
          () => super.totalUnreadCount,
          name: '_AppStore.totalUnreadCount'))
      .value;

  late final _$categoriesAtom =
      Atom(name: '_AppStore.categories', context: context);

  @override
  ObservableList<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$selectedCategoryAtom =
      Atom(name: '_AppStore.selectedCategory', context: context);

  @override
  Category? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(Category? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$selectedFeedAtom =
      Atom(name: '_AppStore.selectedFeed', context: context);

  @override
  Feed? get selectedFeed {
    _$selectedFeedAtom.reportRead();
    return super.selectedFeed;
  }

  @override
  set selectedFeed(Feed? value) {
    _$selectedFeedAtom.reportWrite(value, super.selectedFeed, () {
      super.selectedFeed = value;
    });
  }

  late final _$selectedArticleAtom =
      Atom(name: '_AppStore.selectedArticle', context: context);

  @override
  Article? get selectedArticle {
    _$selectedArticleAtom.reportRead();
    return super.selectedArticle;
  }

  @override
  set selectedArticle(Article? value) {
    _$selectedArticleAtom.reportWrite(value, super.selectedArticle, () {
      super.selectedArticle = value;
    });
  }

  late final _$isDarkModeAtom =
      Atom(name: '_AppStore.isDarkMode', context: context);

  @override
  bool get isDarkMode {
    _$isDarkModeAtom.reportRead();
    return super.isDarkMode;
  }

  @override
  set isDarkMode(bool value) {
    _$isDarkModeAtom.reportWrite(value, super.isDarkMode, () {
      super.isDarkMode = value;
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

  late final _$_AppStoreActionController =
      ActionController(name: '_AppStore', context: context);

  @override
  void selectCategory(Category? category) {
    final _$actionInfo = _$_AppStoreActionController.startAction(
        name: '_AppStore.selectCategory');
    try {
      return super.selectCategory(category);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectFeed(Feed? feed) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.selectFeed');
    try {
      return super.selectFeed(feed);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectArticle(Article? article) {
    final _$actionInfo = _$_AppStoreActionController.startAction(
        name: '_AppStore.selectArticle');
    try {
      return super.selectArticle(article);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleDarkMode() {
    final _$actionInfo = _$_AppStoreActionController.startAction(
        name: '_AppStore.toggleDarkMode');
    try {
      return super.toggleDarkMode();
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
  void addCategory(Category category) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.addCategory');
    try {
      return super.addCategory(category);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCategory(Category category) {
    final _$actionInfo = _$_AppStoreActionController.startAction(
        name: '_AppStore.removeCategory');
    try {
      return super.removeCategory(category);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategories(List<Category> newCategories) {
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
categories: ${categories},
selectedCategory: ${selectedCategory},
selectedFeed: ${selectedFeed},
selectedArticle: ${selectedArticle},
isDarkMode: ${isDarkMode},
fontSize: ${fontSize},
allFeeds: ${allFeeds},
allArticles: ${allArticles},
currentArticles: ${currentArticles},
starredArticles: ${starredArticles},
totalUnreadCount: ${totalUnreadCount}
    ''';
  }
}
