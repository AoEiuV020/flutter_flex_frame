import 'package:get_it/get_it.dart';

import '../../repositories/article_repository.dart';
import '../../repositories/feed_repository.dart';
import '../../repositories/implementations/article_repository_impl.dart';
import '../../repositories/implementations/feed_repository_impl.dart';
import '../../stores/app_store.dart';
import '../../stores/feed_edit_store.dart';
import '../../stores/layout_store.dart';
import '../database/database.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  // Database
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  // Repositories
  getIt.registerLazySingleton<FeedRepository>(
    () => FeedRepositoryImpl(getIt<AppDatabase>()),
  );
  getIt.registerLazySingleton<ArticleRepository>(
    () => ArticleRepositoryImpl(getIt<AppDatabase>()),
  );

  // Stores
  getIt.registerLazySingleton<AppStore>(() => AppStore());
  getIt.registerLazySingleton<LayoutStore>(() => LayoutStore());
  getIt.registerFactory<FeedEditStore>(() => FeedEditStore());
}
