class Article {
  final String id;
  final String title;
  final String content;
  final String? summary;
  final DateTime publishDate;
  final String? author;
  final bool isRead;
  final bool isStarred;
  final String feedId;
  final String url;

  const Article({
    required this.id,
    required this.title,
    required this.content,
    this.summary,
    required this.publishDate,
    this.author,
    this.isRead = false,
    this.isStarred = false,
    required this.feedId,
    required this.url,
  });

  String get displaySummary {
    if (summary != null) return summary!;
    if (content.length > 200) return '${content.substring(0, 200)}...';
    return content;
  }
}
