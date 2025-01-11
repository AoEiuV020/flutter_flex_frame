import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import 'core/di/dependencies.dart';
import 'core/router/routes.dart';

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
      routerConfig: router,
      title: 'RSS阅读器',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
