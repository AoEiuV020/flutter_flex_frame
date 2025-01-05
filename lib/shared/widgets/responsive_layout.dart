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
              return _buildMobileLayout();
            } else if (layoutStore.isTablet) {
              return _buildTabletLayout();
            } else {
              return _buildDesktopLayout();
            }
          },
        );
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
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: appStore.selectedArticle != null ? articleContent! : articleList!,
    );
  }

  Widget _buildTabletLayout() {
    return Scaffold(
      body: Row(
        children: [
          if (!layoutStore.isMobile)
            NavigationRail(
              extended: layoutStore.isFeedListExpanded,
              onDestinationSelected: (_) {},
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.menu),
                  label: Text(''),
                ),
              ],
              leading: IconButton(
                icon: Icon(
                  layoutStore.isFeedListExpanded
                      ? Icons.chevron_left
                      : Icons.chevron_right,
                ),
                onPressed: () {
                  layoutStore.toggleFeedList();
                },
              ),
              selectedIndex: 0,
            ),
          if (!layoutStore.isMobile)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: layoutStore.feedListWidth - 72,
              child: feedList,
            ),
          Container(
            width: layoutStore.articleListWidth,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(color: Colors.black12),
              ),
            ),
            child: articleList,
          ),
          if (appStore.selectedArticle != null)
            Expanded(
              child: articleContent!,
            ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: layoutStore.feedListWidth,
            child: feedList,
          ),
          Container(
            width: layoutStore.articleListWidth,
            decoration: const BoxDecoration(
              border: Border.symmetric(
                vertical: BorderSide(color: Colors.black12),
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
