import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'core/di/dependencies.dart';
import 'core/router/routes.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  setupDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('zh', 'CN')],
      path: 'assets/translations',
      fallbackLocale: const Locale('zh', 'CN'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RSS Reader',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: appStore.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerConfig: router,
    );
  }
}
