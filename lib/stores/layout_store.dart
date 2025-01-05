import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'layout_store.g.dart';

class LayoutStore = _LayoutStore with _$LayoutStore;

abstract class _LayoutStore with Store {
  static const double kMobileBreakpoint = 600;
  static const double kTabletBreakpoint = 1200;
  static const double kFeedListWidth = 240;
  static const double kFeedListCollapsedWidth = 72;
  static const double kArticleListWidth = 320;

  @observable
  double windowWidth = 0;

  @observable
  bool isDrawerOpen = false;

  @observable
  bool isFeedListExpanded = true;

  @computed
  bool get isMobile => windowWidth < kMobileBreakpoint;

  @computed
  bool get isTablet =>
      windowWidth >= kMobileBreakpoint && windowWidth < kTabletBreakpoint;

  @computed
  bool get isDesktop => windowWidth >= kTabletBreakpoint;

  @computed
  double get feedListWidth => isMobile
      ? 0 // 移动端使用抽屉，不占用主布局宽度
      : isFeedListExpanded
          ? kFeedListWidth
          : kFeedListCollapsedWidth;

  @computed
  double get articleListWidth => isMobile
      ? windowWidth // 移动端全宽
      : kArticleListWidth; // 平板和桌面固定宽度

  @action
  void setWindowWidth(double width) => windowWidth = width;

  @action
  void toggleDrawer() => isDrawerOpen = !isDrawerOpen;

  @action
  void toggleFeedList() => isFeedListExpanded = !isFeedListExpanded;

  @action
  void closeDrawer() => isDrawerOpen = false;
}
