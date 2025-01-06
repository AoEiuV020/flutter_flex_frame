import 'package:flutter/material.dart';

import '../../../core/di/dependencies.dart';
import '../../../models/article.dart';
import 'article_list_content.dart';

class ArticleList extends StatelessWidget {
  final String? selectedArticleId;
  final Function(Article) onArticleSelected;

  const ArticleList({
    super.key,
    this.selectedArticleId,
    required this.onArticleSelected,
  });

  @override
  Widget build(BuildContext context) {
    // 桌面端不显示标题栏
    if (layoutStore.isDesktop) {
      return ArticleListContent(
        selectedArticleId: selectedArticleId,
        onArticleSelected: onArticleSelected,
      );
    }

    // 移动端和平板端显示标题栏
    return Column(
      children: [
        AppBar(
          title: Text(appStore.selectedFeed?.title ?? '全部'),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.sort),
              onPressed: () {
                // TODO: 实现排序功能
              },
            ),
          ],
        ),
        Expanded(
          child: ArticleListContent(
            selectedArticleId: selectedArticleId,
            onArticleSelected: onArticleSelected,
          ),
        ),
      ],
    );
  }
}
