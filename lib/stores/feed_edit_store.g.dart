// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_edit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FeedEditStore on _FeedEditStore, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??=
          Computed<bool>(() => super.isValid, name: '_FeedEditStore.isValid'))
      .value;

  late final _$titleAtom = Atom(name: '_FeedEditStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$urlAtom = Atom(name: '_FeedEditStore.url', context: context);

  @override
  String get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  late final _$categoryAtom =
      Atom(name: '_FeedEditStore.category', context: context);

  @override
  String get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(String value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  late final _$iconUrlAtom =
      Atom(name: '_FeedEditStore.iconUrl', context: context);

  @override
  String? get iconUrl {
    _$iconUrlAtom.reportRead();
    return super.iconUrl;
  }

  @override
  set iconUrl(String? value) {
    _$iconUrlAtom.reportWrite(value, super.iconUrl, () {
      super.iconUrl = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_FeedEditStore.isLoading', context: context);

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

  late final _$errorAtom = Atom(name: '_FeedEditStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$feedIdAtom =
      Atom(name: '_FeedEditStore.feedId', context: context);

  @override
  String? get feedId {
    _$feedIdAtom.reportRead();
    return super.feedId;
  }

  @override
  set feedId(String? value) {
    _$feedIdAtom.reportWrite(value, super.feedId, () {
      super.feedId = value;
    });
  }

  late final _$availableCategoriesAtom =
      Atom(name: '_FeedEditStore.availableCategories', context: context);

  @override
  ObservableList<String> get availableCategories {
    _$availableCategoriesAtom.reportRead();
    return super.availableCategories;
  }

  @override
  set availableCategories(ObservableList<String> value) {
    _$availableCategoriesAtom.reportWrite(value, super.availableCategories, () {
      super.availableCategories = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_FeedEditStore.init', context: context);

  @override
  Future<void> init(String? id) {
    return _$initAsyncAction.run(() => super.init(id));
  }

  late final _$saveAsyncAction =
      AsyncAction('_FeedEditStore.save', context: context);

  @override
  Future<bool> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$loadFeedAsyncAction =
      AsyncAction('_FeedEditStore.loadFeed', context: context);

  @override
  Future<void> loadFeed(String id) {
    return _$loadFeedAsyncAction.run(() => super.loadFeed(id));
  }

  late final _$loadCategoriesAsyncAction =
      AsyncAction('_FeedEditStore.loadCategories', context: context);

  @override
  Future<void> loadCategories() {
    return _$loadCategoriesAsyncAction.run(() => super.loadCategories());
  }

  late final _$_FeedEditStoreActionController =
      ActionController(name: '_FeedEditStore', context: context);

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_FeedEditStoreActionController.startAction(
        name: '_FeedEditStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_FeedEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUrl(String value) {
    final _$actionInfo = _$_FeedEditStoreActionController.startAction(
        name: '_FeedEditStore.setUrl');
    try {
      return super.setUrl(value);
    } finally {
      _$_FeedEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(String value) {
    final _$actionInfo = _$_FeedEditStoreActionController.startAction(
        name: '_FeedEditStore.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_FeedEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIconUrl(String? value) {
    final _$actionInfo = _$_FeedEditStoreActionController.startAction(
        name: '_FeedEditStore.setIconUrl');
    try {
      return super.setIconUrl(value);
    } finally {
      _$_FeedEditStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
url: ${url},
category: ${category},
iconUrl: ${iconUrl},
isLoading: ${isLoading},
error: ${error},
feedId: ${feedId},
availableCategories: ${availableCategories},
isValid: ${isValid}
    ''';
  }
}
