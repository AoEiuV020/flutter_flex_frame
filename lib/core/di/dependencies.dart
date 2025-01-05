import 'package:get_it/get_it.dart';

import '../../stores/app_store.dart';
import '../../stores/layout_store.dart';
import 'mock_data.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Stores
  getIt.registerLazySingleton(() {
    final store = AppStore();
    store.setCategories(mockCategories);
    return store;
  });
  getIt.registerLazySingleton(() => LayoutStore());
}

// Store getters
AppStore get appStore => getIt<AppStore>();
LayoutStore get layoutStore => getIt<LayoutStore>();
