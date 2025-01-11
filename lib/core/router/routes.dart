import 'package:go_router/go_router.dart';

import '../../features/feed_management/feed_edit_page.dart';
import '../../features/home/home_page.dart';
import '../../features/settings/settings_page.dart';
import '../../features/splash/splash_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/feed/add',
      builder: (context, state) => const FeedEditPage(),
    ),
    GoRoute(
      path: '/feed/edit/:id',
      builder: (context, state) => FeedEditPage(
        feedId: state.pathParameters['id'],
      ),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);
