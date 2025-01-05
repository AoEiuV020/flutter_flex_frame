// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'layout_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LayoutStore on _LayoutStore, Store {
  Computed<bool>? _$isMobileComputed;

  @override
  bool get isMobile => (_$isMobileComputed ??=
          Computed<bool>(() => super.isMobile, name: '_LayoutStore.isMobile'))
      .value;
  Computed<bool>? _$isTabletComputed;

  @override
  bool get isTablet => (_$isTabletComputed ??=
          Computed<bool>(() => super.isTablet, name: '_LayoutStore.isTablet'))
      .value;
  Computed<bool>? _$isDesktopComputed;

  @override
  bool get isDesktop => (_$isDesktopComputed ??=
          Computed<bool>(() => super.isDesktop, name: '_LayoutStore.isDesktop'))
      .value;
  Computed<double>? _$feedListWidthComputed;

  @override
  double get feedListWidth =>
      (_$feedListWidthComputed ??= Computed<double>(() => super.feedListWidth,
              name: '_LayoutStore.feedListWidth'))
          .value;
  Computed<double>? _$articleListWidthComputed;

  @override
  double get articleListWidth => (_$articleListWidthComputed ??=
          Computed<double>(() => super.articleListWidth,
              name: '_LayoutStore.articleListWidth'))
      .value;

  late final _$windowWidthAtom =
      Atom(name: '_LayoutStore.windowWidth', context: context);

  @override
  double get windowWidth {
    _$windowWidthAtom.reportRead();
    return super.windowWidth;
  }

  @override
  set windowWidth(double value) {
    _$windowWidthAtom.reportWrite(value, super.windowWidth, () {
      super.windowWidth = value;
    });
  }

  late final _$isFeedListExpandedAtom =
      Atom(name: '_LayoutStore.isFeedListExpanded', context: context);

  @override
  bool get isFeedListExpanded {
    _$isFeedListExpandedAtom.reportRead();
    return super.isFeedListExpanded;
  }

  @override
  set isFeedListExpanded(bool value) {
    _$isFeedListExpandedAtom.reportWrite(value, super.isFeedListExpanded, () {
      super.isFeedListExpanded = value;
    });
  }

  late final _$isDrawerOpenAtom =
      Atom(name: '_LayoutStore.isDrawerOpen', context: context);

  @override
  bool get isDrawerOpen {
    _$isDrawerOpenAtom.reportRead();
    return super.isDrawerOpen;
  }

  @override
  set isDrawerOpen(bool value) {
    _$isDrawerOpenAtom.reportWrite(value, super.isDrawerOpen, () {
      super.isDrawerOpen = value;
    });
  }

  late final _$_LayoutStoreActionController =
      ActionController(name: '_LayoutStore', context: context);

  @override
  void setWindowWidth(double width) {
    final _$actionInfo = _$_LayoutStoreActionController.startAction(
        name: '_LayoutStore.setWindowWidth');
    try {
      return super.setWindowWidth(width);
    } finally {
      _$_LayoutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleFeedList() {
    final _$actionInfo = _$_LayoutStoreActionController.startAction(
        name: '_LayoutStore.toggleFeedList');
    try {
      return super.toggleFeedList();
    } finally {
      _$_LayoutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleDrawer() {
    final _$actionInfo = _$_LayoutStoreActionController.startAction(
        name: '_LayoutStore.toggleDrawer');
    try {
      return super.toggleDrawer();
    } finally {
      _$_LayoutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void closeDrawer() {
    final _$actionInfo = _$_LayoutStoreActionController.startAction(
        name: '_LayoutStore.closeDrawer');
    try {
      return super.closeDrawer();
    } finally {
      _$_LayoutStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
windowWidth: ${windowWidth},
isFeedListExpanded: ${isFeedListExpanded},
isDrawerOpen: ${isDrawerOpen},
isMobile: ${isMobile},
isTablet: ${isTablet},
isDesktop: ${isDesktop},
feedListWidth: ${feedListWidth},
articleListWidth: ${articleListWidth}
    ''';
  }
}
