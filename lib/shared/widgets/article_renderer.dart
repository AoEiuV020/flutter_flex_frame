import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/di/dependencies.dart';
import '../../models/article.dart';
import '../../stores/article_store.dart';

class ArticleRenderer extends StatelessWidget {
  final Article article;
  final VoidCallback? onToggleRead;
  final VoidCallback? onToggleStarred;

  const ArticleRenderer({
    super.key,
    required this.article,
    this.onToggleRead,
    this.onToggleStarred,
  });

  @override
  Widget build(BuildContext context) {
    final articleStore = appStore.getArticleStore(article);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (layoutStore.isMobile)
          _buildMobileHeader(context)
        else
          _buildDesktopHeader(context),
        _buildContent(context),
        _buildFooter(context, articleStore),
      ],
    );
  }

  Widget _buildMobileHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: kToolbarHeight,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              IconButton(
                padding: const EdgeInsets.all(8),
                icon: const Icon(Icons.arrow_back),
                onPressed: () => appStore.selectArticle(null),
              ),
              Expanded(
                child: Text(
                  article.title,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        if (article.author != null || article.publishDate != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
            child: Row(
              children: [
                if (article.author != null) ...[
                  Text(
                    article.author!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  _formatDate(article.publishDate),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildDesktopHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (article.author != null) ...[
                Text(
                  article.author!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                _formatDate(article.publishDate),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Html(
          data: article.content,
          style: {
            "body": Style(
              fontSize: FontSize(appStore.fontSize),
              lineHeight: LineHeight.number(1.6),
            ),
          },
          onLinkTap: (url, _, __) {
            if (url != null) {
              launchUrl(Uri.parse(url));
            }
          },
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context, ArticleStore articleStore) {
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                articleStore.isRead
                    ? Icons.visibility
                    : Icons.visibility_outlined,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                articleStore.toggleRead();
                onToggleRead?.call();
              },
            ),
            IconButton(
              icon: Icon(
                articleStore.isStarred ? Icons.star : Icons.star_border,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                articleStore.toggleStarred();
                onToggleStarred?.call();
              },
            ),
            IconButton(
              icon: const Icon(Icons.open_in_browser),
              onPressed: () => launchUrl(Uri.parse(article.url)),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
