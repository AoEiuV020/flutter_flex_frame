import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/di/dependencies.dart';
import '../../../shared/widgets/article_renderer.dart';
import '../../../stores/app_store.dart';

class ArticleView extends StatelessWidget {
  final VoidCallback? onToggleRead;
  final VoidCallback? onToggleStarred;

  const ArticleView({
    super.key,
    this.onToggleRead,
    this.onToggleStarred,
  });

  @override
  Widget build(BuildContext context) {
    final appStore = getIt<AppStore>();

    return Observer(
      builder: (context) {
        if (appStore.selectedArticle == null) {
          return const Center(
            child: Text('请选择一篇文章'),
          );
        }

        return ArticleRenderer(
          article: appStore.selectedArticle!,
          onToggleRead: onToggleRead,
          onToggleStarred: onToggleStarred,
        );
      },
    );
  }
}
