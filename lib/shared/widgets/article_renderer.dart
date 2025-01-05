import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/di/dependencies.dart';
import '../../models/article.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        _buildContent(context),
        _buildFooter(context),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
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

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: Icon(
              article.isRead ? Icons.visibility : Icons.visibility_outlined,
            ),
            onPressed: onToggleRead,
          ),
          IconButton(
            icon: Icon(
              article.isStarred ? Icons.star : Icons.star_border,
            ),
            onPressed: onToggleStarred,
          ),
          IconButton(
            icon: const Icon(Icons.open_in_browser),
            onPressed: () => launchUrl(Uri.parse(article.url)),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
