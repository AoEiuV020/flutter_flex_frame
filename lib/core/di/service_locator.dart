import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../stores/auth_store.dart';
import '../../stores/navigation_store.dart';
import '../../stores/theme_store.dart';
import '../router/app_router.dart';
import '../theme/app_theme.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // 初始化 SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);

  // Stores
  getIt.registerLazySingleton(() => AuthStore(getIt<SharedPreferences>()));
  getIt.registerLazySingleton(() => NavigationStore());
  getIt.registerLazySingleton(() => ThemeStore());

  // Services
  getIt.registerLazySingleton(() => AppThemeService());
  getIt.registerLazySingleton(() => AppRouter(
        getIt<AuthStore>(),
        getIt<NavigationStore>(),
      ));
}
