import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

part 'layout_store.g.dart';

class LayoutStore = _LayoutStore with _$LayoutStore;

abstract class _LayoutStore with Store {
  static const double kMobileBreakpoint = 600;
  static const double kTabletBreakpoint = 1200;
  static const double kFeedListWidth = 320;
  static const double kArticleListWidth = 400;

  BuildContext? _drawerContext;

  @observable
  bool isDrawerOpen = false;

  @observable
  double screenWidth = 0;

  @observable
  bool isFeedListExpanded = true;

  @computed
  bool get isMobile => screenWidth < kMobileBreakpoint;

  @computed
  bool get isTablet =>
      screenWidth >= kMobileBreakpoint && screenWidth < kTabletBreakpoint;

  @computed
  bool get isDesktop => screenWidth >= kTabletBreakpoint;

  @computed
  double get feedListWidth => kFeedListWidth;

  @computed
  double get articleListWidth => kArticleListWidth;

  @action
  void setWindowWidth(double width) {
    final oldWidth = screenWidth;
    screenWidth = width;

    // 处理视图切换时的状态
    if (oldWidth > 0) {
      // 忽略初始化
      if (isDesktop) {
        // 切换到桌面视图时，清除抽屉状态
        isDrawerOpen = false;
        _drawerContext = null;
        isFeedListExpanded = true;
      } else if (isTablet) {
        isFeedListExpanded = false;
      }
    }
  }

  void setDrawerContext(BuildContext context) {
    _drawerContext = context;
  }

  @action
  void openDrawer() {
    if (_drawerContext != null && (isMobile || isTablet)) {
      Scaffold.of(_drawerContext!).openDrawer();
      isDrawerOpen = true;
    }
  }

  @action
  void closeDrawer() {
    if (_drawerContext != null && (isMobile || isTablet)) {
      Scaffold.of(_drawerContext!).closeDrawer();
      isDrawerOpen = false;
    }
  }

  @action
  void toggleDrawer() {
    if (isDrawerOpen) {
      closeDrawer();
    } else {
      openDrawer();
    }
  }

  @action
  void toggleFeedList() {
    isFeedListExpanded = !isFeedListExpanded;
  }
}
