import 'package:go_router/go_router.dart';

import '../../features/auth/login_page.dart';
import '../../features/dashboard/dashboard_page.dart';
import '../../features/detail/detail_page.dart';
import '../../features/list/list_page.dart';
import '../../features/settings/settings_page.dart';
import '../../stores/auth_store.dart';
import '../../stores/navigation_store.dart';

class AppRouter {
  final AuthStore authStore;
  final NavigationStore navigationStore;

  AppRouter({
    required this.authStore,
    required this.navigationStore,
  });

  late final config = GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isLoggedIn = authStore.isLoggedIn;
      final isLoginRoute = state.matchedLocation == '/login';

      if (!isLoggedIn && !isLoginRoute) {
        return '/login';
      }
      if (isLoggedIn && isLoginRoute) {
        return '/dashboard';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: '/list',
        builder: (context, state) => const ListPage(),
      ),
      GoRoute(
        path: '/detail/:id',
        builder: (context, state) => DetailPage(
          id: state.pathParameters['id'] ?? '',
        ),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}
