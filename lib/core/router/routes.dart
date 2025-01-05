import 'package:go_router/go_router.dart';

import '../../features/about/about_page.dart';
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
      routes: [
        GoRoute(
          path: 'feed/:feedId',
          builder: (context, state) => HomePage(
            feedId: state.pathParameters['feedId'],
          ),
          routes: [
            GoRoute(
              path: 'article/:articleId',
              builder: (context, state) => HomePage(
                feedId: state.pathParameters['feedId'],
                articleId: state.pathParameters['articleId'],
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/feed/add',
      builder: (context, state) => const FeedEditPage(),
    ),
    GoRoute(
      path: '/feed/edit/:feedId',
      builder: (context, state) => FeedEditPage(
        feedId: state.pathParameters['feedId'],
      ),
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutPage(),
    ),
  ],
);
