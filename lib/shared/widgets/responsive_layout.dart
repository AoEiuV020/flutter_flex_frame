import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/di/dependencies.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget? feedList;
  final Widget? articleList;
  final Widget? articleContent;

  const ResponsiveLayout({
    super.key,
    this.feedList,
    this.articleList,
    this.articleContent,
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
      drawer: feedList != null
          ? Drawer(
              child: feedList!,
            )
          : null,
      body: appStore.selectedArticle != null ? articleContent! : articleList!,
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          if (layoutStore.isFeedListExpanded)
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
                child: articleContent!,
              ),
            ),
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
            child: articleContent ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
