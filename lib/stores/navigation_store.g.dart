// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavigationStore on _NavigationStore, Store {
  late final _$currentRouteAtom =
      Atom(name: '_NavigationStore.currentRoute', context: context);

  @override
  String get currentRoute {
    _$currentRouteAtom.reportRead();
    return super.currentRoute;
  }

  @override
  set currentRoute(String value) {
    _$currentRouteAtom.reportWrite(value, super.currentRoute, () {
      super.currentRoute = value;
    });
  }

  late final _$isDrawerOpenAtom =
      Atom(name: '_NavigationStore.isDrawerOpen', context: context);

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

  late final _$isSecondaryNavCollapsedAtom =
      Atom(name: '_NavigationStore.isSecondaryNavCollapsed', context: context);

  @override
  bool get isSecondaryNavCollapsed {
    _$isSecondaryNavCollapsedAtom.reportRead();
    return super.isSecondaryNavCollapsed;
  }

  @override
  set isSecondaryNavCollapsed(bool value) {
    _$isSecondaryNavCollapsedAtom
        .reportWrite(value, super.isSecondaryNavCollapsed, () {
      super.isSecondaryNavCollapsed = value;
    });
  }

  late final _$_NavigationStoreActionController =
      ActionController(name: '_NavigationStore', context: context);

  @override
  void setCurrentRoute(String route) {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.setCurrentRoute');
    try {
      return super.setCurrentRoute(route);
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleDrawer() {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.toggleDrawer');
    try {
      return super.toggleDrawer();
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSecondaryNav() {
    final _$actionInfo = _$_NavigationStoreActionController.startAction(
        name: '_NavigationStore.toggleSecondaryNav');
    try {
      return super.toggleSecondaryNav();
    } finally {
      _$_NavigationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentRoute: ${currentRoute},
isDrawerOpen: ${isDrawerOpen},
isSecondaryNavCollapsed: ${isSecondaryNavCollapsed}
    ''';
  }
}
