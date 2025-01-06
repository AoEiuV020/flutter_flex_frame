import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/di/dependencies.dart';
import '../../shared/widgets/responsive_layout.dart';
import 'widgets/article_list.dart';
import 'widgets/article_view.dart';
import 'widgets/feed_list.dart';

class HomePage extends StatelessWidget {
  final String? feedId;
  final String? articleId;

  const HomePage({
    super.key,
    this.feedId,
    this.articleId,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ResponsiveLayout(
          feedList: FeedList(
            selectedFeedId: feedId,
            onFeedSelected: (feed) {
              appStore.selectFeed(feed);
              if (layoutStore.isMobile) {
                layoutStore.closeDrawer();
              }
            },
          ),
          articleList: ArticleList(
            selectedArticleId: articleId,
            onArticleSelected: (article) {
              appStore.selectArticle(article);
            },
          ),
          articleContent: ArticleView(
            onToggleRead: () {
              if (appStore.selectedArticle != null) {
                final articleStore =
                    appStore.getArticleStore(appStore.selectedArticle!);
                articleStore.toggleRead();
              }
            },
            onToggleStarred: () {
              if (appStore.selectedArticle != null) {
                final articleStore =
                    appStore.getArticleStore(appStore.selectedArticle!);
                articleStore.toggleStarred();
              }
            },
          ),
        );
      },
    );
  }
}
