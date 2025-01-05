import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = _NavigationStore with _$NavigationStore;

abstract class _NavigationStore with Store {
  @observable
  String currentRoute = '/';

  @observable
  bool isDrawerOpen = false;

  @observable
  bool isSecondaryNavCollapsed = false;

  @action
  void setCurrentRoute(String route) {
    currentRoute = route;
  }

  @action
  void toggleDrawer() {
    isDrawerOpen = !isDrawerOpen;
  }

  @action
  void toggleSecondaryNav() {
    isSecondaryNavCollapsed = !isSecondaryNavCollapsed;
  }
}
