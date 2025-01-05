import 'package:mobx/mobx.dart';

part 'layout_store.g.dart';

class LayoutStore = _LayoutStore with _$LayoutStore;

abstract class _LayoutStore with Store {
  static const double kMobileBreakpoint = 600;
  static const double kTabletBreakpoint = 1200;

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
      ? windowWidth
      : isFeedListExpanded
          ? 240
          : 72;

  @computed
  double get articleListWidth => isMobile ? windowWidth : 320;

  @action
  void setWindowWidth(double width) => windowWidth = width;

  @action
  void toggleDrawer() => isDrawerOpen = !isDrawerOpen;

  @action
  void toggleFeedList() => isFeedListExpanded = !isFeedListExpanded;

  @action
  void closeDrawer() => isDrawerOpen = false;
}
