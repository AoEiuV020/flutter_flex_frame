import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/di/dependencies.dart';
import '../../../stores/app_store.dart';

class ArticleListContent extends StatelessWidget {
  final String? selectedArticleId;
  final Function(String) onArticleSelected;

  const ArticleListContent({
    super.key,
    this.selectedArticleId,
    required this.onArticleSelected,
  });

  @override
  Widget build(BuildContext context) {
    final appStore = getIt<AppStore>();

    return Observer(
      builder: (context) {
        if (appStore.articles.isEmpty) {
          return const Center(
            child: Text('暂无文章'),
          );
        }

        return ListView.builder(
          itemCount: appStore.articles.length,
          itemBuilder: (context, index) {
            final article = appStore.articles[index];
            final isSelected = selectedArticleId == article.id;

            return ListTile(
              selected: isSelected,
              title: Text(
                article.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Row(
                children: [
                  if (article.author != null) ...[
                    Text(article.author!),
                    const SizedBox(width: 8),
                  ],
                  Text(_formatDate(article.publishDate)),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (article.isStarred)
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber,
                    ),
                  if (!article.isRead)
                    Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                ],
              ),
              onTap: () => onArticleSelected(article.id),
            );
          },
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
