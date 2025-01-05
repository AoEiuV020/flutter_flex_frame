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
    return Observer(
      builder: (context) {
        if (layoutStore.isMobile) {
          return _buildMobileLayout();
        } else if (layoutStore.isTablet) {
          return _buildTabletLayout();
        } else {
          return _buildDesktopLayout();
        }
      },
    );
  }

  Widget _buildMobileLayout() {
    return Scaffold(
      drawer: feedList != null
          ? Drawer(
              child: feedList!,
            )
          : null,
      body: articleContent ?? articleList ?? const SizedBox(),
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: [
        if (feedList != null)
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: layoutStore.feedListWidth,
            child: feedList,
          ),
        if (articleList != null)
          SizedBox(
            width: layoutStore.articleListWidth,
            child: articleList,
          ),
        if (articleContent != null)
          Expanded(
            child: articleContent!,
          ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        if (feedList != null)
          SizedBox(
            width: layoutStore.feedListWidth,
            child: feedList,
          ),
        if (articleList != null)
          SizedBox(
            width: layoutStore.articleListWidth,
            child: articleList,
          ),
        if (articleContent != null)
          Expanded(
            child: articleContent!,
          ),
      ],
    );
  }
}
