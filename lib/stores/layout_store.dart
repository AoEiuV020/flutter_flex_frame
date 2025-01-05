import 'package:mobx/mobx.dart';

part 'layout_store.g.dart';

class LayoutStore = _LayoutStore with _$LayoutStore;

abstract class _LayoutStore with Store {
  static const double kMobileBreakpoint = 600;
  static const double kTabletBreakpoint = 1200;
  static const double kFeedListWidth = 240;
  static const double kArticleListWidth = 320;

  @observable
  double windowWidth = 0;

  @observable
  bool isFeedListExpanded = true;

  @observable
  bool isDrawerOpen = false;

  @computed
  bool get isMobile => windowWidth < kMobileBreakpoint;

  @computed
  bool get isTablet =>
      windowWidth >= kMobileBreakpoint && windowWidth < kTabletBreakpoint;

  @computed
  bool get isDesktop => windowWidth >= kTabletBreakpoint;

  @computed
  double get feedListWidth => kFeedListWidth;

  @computed
  double get articleListWidth => kArticleListWidth;

  @action
  void setWindowWidth(double width) {
    windowWidth = width;
    // 根据窗口宽度自动调整展开状态
    if (isDesktop) {
      isFeedListExpanded = true;
    } else if (isTablet) {
      isFeedListExpanded = false;
    }
  }

  @action
  void toggleFeedList() {
    isFeedListExpanded = !isFeedListExpanded;
  }

  @action
  void toggleDrawer() {
    isDrawerOpen = !isDrawerOpen;
  }

  @action
  void closeDrawer() {
    isDrawerOpen = false;
  }
}
