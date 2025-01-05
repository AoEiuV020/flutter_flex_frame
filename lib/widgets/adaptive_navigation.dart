import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

class AdaptiveNavigation extends StatelessWidget {
  final int selectedIndex;

  const AdaptiveNavigation({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: MediaQuery.of(context).size.width >= 800,
      destinations: [
        NavigationRailDestination(
          icon: const Icon(Icons.dashboard),
          label: Text('navigation.dashboard'.tr()),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.list),
          label: Text('navigation.list'.tr()),
        ),
        NavigationRailDestination(
          icon: const Icon(Icons.settings),
          label: Text('navigation.settings'.tr()),
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            context.go('/dashboard');
            break;
          case 1:
            context.go('/list');
            break;
          case 2:
            context.go('/settings');
            break;
        }
      },
    );
  }
}
