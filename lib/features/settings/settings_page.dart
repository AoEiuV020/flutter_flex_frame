import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../core/di/service_locator.dart';
import '../../stores/auth_store.dart';
import '../../stores/theme_store.dart';
import '../../widgets/adaptive_navigation.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _version = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadVersion();
  }

  Future<void> _loadVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        _version = packageInfo.version;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authStore = getIt<AuthStore>();
    final themeStore = getIt<ThemeStore>();

    return Scaffold(
      body: Row(
        children: [
          const AdaptiveNavigation(selectedIndex: 2),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // 主题设置
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
                        const Divider(),
                        Observer(
                          builder: (_) => Column(
                            children: [
                              RadioListTile<ThemeMode>(
                                title: Text('settings.theme.system'.tr()),
                                value: ThemeMode.system,
                                groupValue: themeStore.themeMode,
                                onChanged: (value) {
                                  if (value != null) {
                                    themeStore.setThemeMode(value);
                                  }
                                },
                              ),
                              RadioListTile<ThemeMode>(
                                title: Text('settings.theme.light'.tr()),
                                value: ThemeMode.light,
                                groupValue: themeStore.themeMode,
                                onChanged: (value) {
                                  if (value != null) {
                                    themeStore.setThemeMode(value);
                                  }
                                },
                              ),
                              RadioListTile<ThemeMode>(
                                title: Text('settings.theme.dark'.tr()),
                                value: ThemeMode.dark,
                                groupValue: themeStore.themeMode,
                                onChanged: (value) {
                                  if (value != null) {
                                    themeStore.setThemeMode(value);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // 语言设置
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'settings.language.title'.tr(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Divider(),
                        RadioListTile<String>(
                          title: Text('settings.language.english'.tr()),
                          value: 'en',
                          groupValue: context.locale.languageCode,
                          onChanged: (value) {
                            if (value != null) {
                              context.setLocale(const Locale('en'));
                            }
                          },
                        ),
                        RadioListTile<String>(
                          title: Text('settings.language.chinese'.tr()),
                          value: 'zh',
                          groupValue: context.locale.languageCode,
                          onChanged: (value) {
                            if (value != null) {
                              context.setLocale(const Locale('zh'));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // 账户设置
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
                        const Divider(),
                        ListTile(
                          title: Text('settings.account.user_type'.tr()),
                          leading: const Icon(Icons.person_outline),
                          trailing: const Icon(Icons.lock_outline),
                        ),
                        ListTile(
                          title: Text('settings.account.logout'.tr()),
                          leading: const Icon(Icons.logout),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () => authStore.logout(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // 关于
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
                        const Divider(),
                        ListTile(
                          title: Text('settings.about.version'.tr()),
                          leading: const Icon(Icons.info_outline),
                          trailing: _isLoading
                              ? const SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(_version),
                        ),
                        ListTile(
                          title: Text('settings.about.check_update'.tr()),
                          leading: const Icon(Icons.system_update),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            // TODO: 实现检查更新功能
                          },
                        ),
                        ListTile(
                          title: Text('settings.about.privacy'.tr()),
                          leading: const Icon(Icons.privacy_tip_outlined),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            // TODO: 打开隐私政策
                          },
                        ),
                        ListTile(
                          title: Text('settings.about.terms'.tr()),
                          leading: const Icon(Icons.description_outlined),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 16),
                          onTap: () {
                            // TODO: 打开用户协议
                          },
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
