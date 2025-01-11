import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../stores/app_store.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appStore = GetIt.I<AppStore>();

    return Scaffold(
      appBar: AppBar(
        title: Text('settings.title'.tr()),
      ),
      body: Observer(
        builder: (context) {
          return ListView(
            children: [
              ListTile(
                title: Text('settings.theme'.tr()),
                trailing: DropdownButton<ThemeMode>(
                  value: appStore.themeMode,
                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.system,
                      child: Text('settings.theme.system'.tr()),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.light,
                      child: Text('settings.theme.light'.tr()),
                    ),
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Text('settings.theme.dark'.tr()),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      appStore.setThemeMode(value);
                    }
                  },
                ),
              ),
              ListTile(
                title: Text('settings.language'.tr()),
                trailing: DropdownButton<String>(
                  value: appStore.locale.languageCode,
                  items: [
                    DropdownMenuItem(
                      value: 'zh',
                      child: Text('settings.language.zh'.tr()),
                    ),
                    DropdownMenuItem(
                      value: 'en',
                      child: Text('settings.language.en'.tr()),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      appStore.setLocale(Locale(value));
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
