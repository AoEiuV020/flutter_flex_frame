import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/di/dependencies.dart';
import '../../../shared/widgets/article_renderer.dart';

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
    return Observer(
      builder: (context) {
        final article = appStore.selectedArticle;

        if (article == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ArticleRenderer(
          article: article,
          onToggleRead: onToggleRead,
          onToggleStarred: onToggleStarred,
        );
      },
    );
  }
}
