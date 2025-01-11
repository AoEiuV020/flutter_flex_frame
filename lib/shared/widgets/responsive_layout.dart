import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/di/dependencies.dart';
import '../../stores/app_store.dart';
import '../../stores/layout_store.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget feedList;
  final Widget articleList;
  final Widget articleContent;

  final LayoutStore layoutStore = getIt<LayoutStore>();
  final AppStore appStore = getIt<AppStore>();

  ResponsiveLayout({
    super.key,
    required this.feedList,
    required this.articleList,
    required this.articleContent,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        layoutStore.setWindowWidth(constraints.maxWidth);

        return Observer(
          builder: (context) {
            if (layoutStore.isMobile) {
              return _buildMobileLayout(context);
            } else if (layoutStore.isTablet) {
              return _buildTabletLayout(context);
            } else {
              return _buildDesktopLayout(context);
            }
          },
        );
      },
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Scaffold(
      drawer: Builder(
        builder: (context) {
          layoutStore.setDrawerContext(context);
          return Drawer(child: feedList);
        },
      ),
      body: appStore.selectedArticle != null ? articleContent : articleList,
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      drawer: Builder(
        builder: (context) {
          layoutStore.setDrawerContext(context);
          return Drawer(child: feedList);
        },
      ),
      body: Row(
        children: [
          Container(
            width: layoutStore.articleListWidth,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: articleList,
          ),
          if (appStore.selectedArticle != null)
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                ),
                child: articleContent,
              ),
            ),
          if (appStore.selectedArticle == null)
            const Expanded(child: Center(child: Text('请选择一篇文章'))),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: layoutStore.feedListWidth,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: feedList,
          ),
          Container(
            width: layoutStore.articleListWidth,
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: articleList,
          ),
          Expanded(
            child: appStore.selectedArticle != null
                ? articleContent
                : const Center(child: Text('请选择一篇文章')),
          ),
        ],
      ),
    );
  }
}
