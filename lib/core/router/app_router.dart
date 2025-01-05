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
import '../../widgets/adaptive_navigation.dart';

class AppRouter {
  final AuthStore _authStore;
  final NavigationStore _navigationStore;
  late final ReactionDisposer _disposer;
  late final GoRouter config;

  CustomTransitionPage<void> _buildPage({
    required LocalKey key,
    required Widget child,
  }) {
    return CustomTransitionPage(
      key: key,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return Stack(
          children: [
            FadeTransition(
              opacity: secondaryAnimation.drive(
                Tween(begin: 1.0, end: 0.0)
                    .chain(CurveTween(curve: Curves.easeOut)),
              ),
              child: const SizedBox.expand(),
            ),
            FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: animation.drive(
                  Tween(
                    begin: const Offset(0.1, 0),
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeInOut)),
                ),
                child: child,
              ),
            ),
          ],
        );
      },
    );
  }

  AppRouter(this._authStore, this._navigationStore) {
    config = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          pageBuilder: (context, state) => _buildPage(
            key: state.pageKey,
            child: const LoginPage(),
          ),
        ),
        ShellRoute(
          builder: (context, state, child) {
            return Scaffold(
              body: Row(
                children: [
                  AdaptiveNavigation(
                    selectedIndex: switch (state.matchedLocation) {
                      '/dashboard' => 0,
                      '/list' => 1,
                      '/settings' => 2,
                      _ => 0,
                    },
                  ),
                  Expanded(
                    child: child,
                  ),
                ],
              ),
            );
          },
          routes: [
            GoRoute(
              path: '/dashboard',
              pageBuilder: (context, state) => _buildPage(
                key: state.pageKey,
                child: const DashboardPage(),
              ),
            ),
            GoRoute(
              path: '/list',
              pageBuilder: (context, state) => _buildPage(
                key: state.pageKey,
                child: const ListPage(),
              ),
            ),
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) => _buildPage(
                key: state.pageKey,
                child: const SettingsPage(),
              ),
            ),
            GoRoute(
              path: '/detail/:id',
              pageBuilder: (context, state) => _buildPage(
                key: state.pageKey,
                child: DetailPage(
                  id: state.pathParameters['id'] ?? '',
                ),
              ),
            ),
          ],
        ),
      ],
      redirect: _handleRedirect,
    );

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
