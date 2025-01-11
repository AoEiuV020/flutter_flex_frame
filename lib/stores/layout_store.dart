import 'package:mobx/mobx.dart';

part 'layout_store.g.dart';

class LayoutStore = _LayoutStore with _$LayoutStore;

abstract class _LayoutStore with Store {
  static const double kMobileBreakpoint = 600;
  static const double kTabletBreakpoint = 1200;
  static const double kFeedListWidth = 320;
  static const double kArticleListWidth = 400;

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
    screenWidth = width;
    // 根据窗口宽度自动调整展开状态
    if (isDesktop) {
      isFeedListExpanded = true;
    } else if (isTablet) {
      isFeedListExpanded = false;
    }
  }

  @action
  void openDrawer() {
    isDrawerOpen = true;
  }

  @action
  void closeDrawer() {
    isDrawerOpen = false;
  }

  @action
  void toggleDrawer() {
    isDrawerOpen = !isDrawerOpen;
  }

  @action
  void toggleFeedList() {
    isFeedListExpanded = !isFeedListExpanded;
  }
}
