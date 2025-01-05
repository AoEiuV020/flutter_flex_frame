import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../stores/auth_store.dart';
import '../../../stores/theme_store.dart';
import '../../widgets/adaptive_navigation.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeStore = GetIt.instance<ThemeStore>();
    final authStore = GetIt.instance<AuthStore>();

    return Scaffold(
      body: Row(
        children: [
          const AdaptiveNavigation(selectedIndex: 2),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'settings.theme.title'.tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        Observer(
                          builder: (_) => SegmentedButton<ThemeMode>(
                            segments: [
                              ButtonSegment(
                                value: ThemeMode.system,
                                icon: const Icon(Icons.brightness_auto),
                                label: Text('settings.theme.system'.tr()),
                              ),
                              ButtonSegment(
                                value: ThemeMode.light,
                                icon: const Icon(Icons.light_mode),
                                label: Text('settings.theme.light'.tr()),
                              ),
                              ButtonSegment(
                                value: ThemeMode.dark,
                                icon: const Icon(Icons.dark_mode),
                                label: Text('settings.theme.dark'.tr()),
                              ),
                            ],
                            selected: {themeStore.themeMode},
                            onSelectionChanged: (Set<ThemeMode> modes) {
                              themeStore.setThemeMode(modes.first);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'settings.account.title'.tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        Observer(
                          builder: (_) => ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                            title: Text(authStore.currentUser ??
                                'settings.account.not_logged_in'.tr()),
                            subtitle: Text('settings.account.user_type'.tr()),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: () => authStore.logout(),
                            child: Text('settings.account.logout'.tr()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'settings.about.title'.tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        ListTile(
                          title: Text('settings.about.version'.tr()),
                          trailing: const Text('1.0.0'),
                          onTap: () {},
                        ),
                        const Divider(),
                        ListTile(
                          title: Text('settings.about.check_update'.tr()),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {},
                        ),
                        const Divider(),
                        ListTile(
                          title: Text('settings.about.privacy'.tr()),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {},
                        ),
                        const Divider(),
                        ListTile(
                          title: Text('settings.about.terms'.tr()),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
