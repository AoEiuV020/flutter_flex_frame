import 'package:get_it/get_it.dart';

import '../../stores/app_store.dart';
import '../../stores/layout_store.dart';
import 'mock_data.dart';

// 全局访问器
AppStore get appStore => GetIt.I<AppStore>();
LayoutStore get layoutStore => GetIt.I<LayoutStore>();

void setupDependencies() {
  // 注册 Store
  GetIt.I.registerLazySingleton(() {
    final store = AppStore();
    store.setCategories(mockCategories);
    return store;
  });
  GetIt.I.registerLazySingleton(() => LayoutStore());

  // 注意：ArticleStore、FeedStore 和 CategoryStore 是按需创建的，
  // 不需要在这里注册为单例
}
