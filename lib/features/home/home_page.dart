import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/di/dependencies.dart';
import '../../shared/widgets/responsive_layout.dart';
import '../../stores/app_store.dart';
import '../../stores/layout_store.dart';
import 'widgets/article_list.dart';
import 'widgets/article_view.dart';
import 'widgets/feed_list.dart';

class HomePage extends StatefulWidget {
  final String? feedId;
  final String? articleId;

  const HomePage({
    super.key,
    this.feedId,
    this.articleId,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final appStore = getIt<AppStore>();
  final layoutStore = getIt<LayoutStore>();

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  Future<void> _loadInitialData() async {
    await appStore.loadFeeds();
    if (widget.feedId != null) {
      appStore.selectFeed(widget.feedId);
      if (widget.articleId != null) {
        appStore.selectArticle(widget.articleId);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ResponsiveLayout(
          feedList: FeedList(
            selectedFeedId: widget.feedId,
            onFeedSelected: (feed) {
              appStore.selectFeed(feed.id);
              if (layoutStore.isMobile) {
                layoutStore.closeDrawer();
              }
            },
          ),
          articleList: ArticleList(
            selectedArticleId: widget.articleId,
            onArticleSelected: (article) {
              appStore.selectArticle(article.id);
            },
          ),
          articleContent: ArticleView(
            onToggleRead: () {
              if (appStore.selectedArticle != null) {
                final articleStore =
                    appStore.getArticleStore(appStore.selectedArticle!.id);
                articleStore.toggleRead();
              }
            },
            onToggleStarred: () {
              if (appStore.selectedArticle != null) {
                final articleStore =
                    appStore.getArticleStore(appStore.selectedArticle!.id);
                articleStore.toggleStarred();
              }
            },
          ),
        );
      },
    );
  }
}
