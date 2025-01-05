import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/di/dependencies.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app.settings'.tr()),
      ),
      body: Observer(
        builder: (context) {
          return ListView(
            children: [
              SwitchListTile(
                title: Text('settings.dark_mode'.tr()),
                value: appStore.isDarkMode,
                onChanged: (value) {
                  appStore.toggleDarkMode();
                },
              ),
              ListTile(
                title: Text('settings.font_size'.tr()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: appStore.fontSize <= 12
                          ? null
                          : () {
                              appStore.setFontSize(appStore.fontSize - 1);
                            },
                    ),
                    Text(appStore.fontSize.toStringAsFixed(0)),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: appStore.fontSize >= 24
                          ? null
                          : () {
                              appStore.setFontSize(appStore.fontSize + 1);
                            },
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text('settings.clear_cache'.tr()),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: 实现清除缓存功能
                },
              ),
              ListTile(
                title: Text('settings.export'.tr()),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: 实现导出功能
                },
              ),
              ListTile(
                title: Text('settings.import'.tr()),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: 实现导入功能
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
