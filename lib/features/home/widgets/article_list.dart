import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/di/dependencies.dart';
import '../../../models/article.dart';

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
    return Observer(
      builder: (context) {
        final articles = appStore.selectedFeed?.articles ?? [];

        return CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(appStore.selectedFeed?.title ?? 'feed.all'.tr()),
              centerTitle: true,
              floating: true,
              actions: [
                IconButton(
                  icon: const Icon(Icons.sort),
                  onPressed: () {
                    // TODO: 实现排序功能
                  },
                ),
              ],
            ),
            if (articles.isEmpty)
              SliverFillRemaining(
                child: Center(
                  child: Text('common.no_data'.tr()),
                ),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final article = articles[index];
                    return ListTile(
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
                      selected: article.id == selectedArticleId,
                      onTap: () => onArticleSelected(article),
                    );
                  },
                  childCount: articles.length,
                ),
              ),
          ],
        );
      },
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
