import 'package:get_it/get_it.dart';

import '../../stores/auth_store.dart';
import '../../stores/navigation_store.dart';
import '../../stores/theme_store.dart';
import '../router/app_router.dart';
import '../theme/app_theme.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Stores
  getIt.registerLazySingleton(() => AuthStore());
  getIt.registerLazySingleton(() => NavigationStore());
  getIt.registerLazySingleton(() => ThemeStore());

  // Services
  getIt.registerLazySingleton(() => AppThemeService());
  getIt.registerLazySingleton(() => AppRouter(
        navigationStore: getIt<NavigationStore>(),
        authStore: getIt<AuthStore>(),
      ));
}
