import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../stores/layout_store.dart';

class AdaptiveNavigation extends StatelessWidget {
  final Widget child;
  final List<NavigationDestination> destinations;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const AdaptiveNavigation({
    super.key,
    required this.child,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  LayoutStore get layoutStore => GetIt.I<LayoutStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (layoutStore.isMobile) {
          return _buildMobileNavigation(context);
        } else if (layoutStore.isTablet) {
          return _buildTabletNavigation(context);
        } else {
          return _buildDesktopNavigation(context);
        }
      },
    );
  }

  Widget _buildMobileNavigation(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: destinations,
      ),
    );
  }

  Widget _buildTabletNavigation(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: layoutStore.isFeedListExpanded,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            destinations: destinations.map((destination) {
              return NavigationRailDestination(
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
                label: Text(destination.label),
              );
            }).toList(),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }

  Widget _buildDesktopNavigation(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: true,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            destinations: destinations.map((destination) {
              return NavigationRailDestination(
                icon: destination.icon,
                selectedIcon: destination.selectedIcon,
                label: Text(destination.label),
              );
            }).toList(),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
