import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import '../../widgets/stat_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: GridView.count(
        key: const ValueKey('dashboard'),
        padding: const EdgeInsets.all(24),
        crossAxisCount: Breakpoints.mediumAndUp.isActive(context) ? 3 : 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: [
          StatCard(
            title: 'dashboard.total_users'.tr(),
            value: '1,234',
            icon: Icons.people,
            color: Colors.blue,
          ),
          StatCard(
            title: 'dashboard.active_users'.tr(),
            value: '891',
            icon: Icons.person_outline,
            color: Colors.green,
          ),
          StatCard(
            title: 'dashboard.new_users'.tr(),
            value: '+123',
            icon: Icons.person_add,
            color: Colors.orange,
          ),
          StatCard(
            title: 'dashboard.online_users'.tr(),
            value: '456',
            icon: Icons.online_prediction,
            color: Colors.purple,
          ),
          StatCard(
            title: 'dashboard.total_revenue'.tr(),
            value: '¥12,345',
            icon: Icons.attach_money,
            color: Colors.red,
          ),
          StatCard(
            title: 'dashboard.conversion_rate'.tr(),
            value: '23.4%',
            icon: Icons.trending_up,
            color: Colors.teal,
          ),
        ],
      ),
    );
  }
}
