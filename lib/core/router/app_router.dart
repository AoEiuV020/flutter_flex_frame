import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';

import '../../features/auth/login_page.dart';
import '../../features/dashboard/dashboard_page.dart';
import '../../features/detail/detail_page.dart';
import '../../features/list/list_page.dart';
import '../../features/settings/settings_page.dart';
import '../../stores/auth_store.dart';
import '../../stores/navigation_store.dart';

class AppRouter {
  final AuthStore _authStore;
  final NavigationStore _navigationStore;
  late final ReactionDisposer _disposer;
  late final GoRouter config;

  AppRouter(this._authStore, this._navigationStore) {
    config = GoRouter(
      initialLocation: '/login',
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
      redirect: _handleRedirect,
    );

    // 使用 reaction 持续监听登录状态变化
    _disposer = reaction(
      (_) => _authStore.isLoggedIn,
      (bool isLoggedIn) {
        if (!isLoggedIn) {
          config.go('/login');
        }
      },
      fireImmediately: true,
    );
  }

  String? _handleRedirect(BuildContext? context, GoRouterState state) {
    final isLoggedIn = _authStore.isLoggedIn;
    final isLoginRoute = state.matchedLocation == '/login';

    if (!isLoggedIn && !isLoginRoute) {
      return '/login';
    }
    if (isLoggedIn && isLoginRoute) {
      return '/dashboard';
    }
    return null;
  }

  void dispose() {
    _disposer();
  }
}
