import '../../models/article.dart';
import '../../models/category.dart';
import '../../models/feed.dart';

final List<Category> mockCategories = [
  Category(
    id: 'tech',
    name: '科技',
    feeds: [
      Feed(
        id: 'sspai',
        title: '少数派',
        url: 'https://sspai.com/feed',
        category: '科技',
        unreadCount: 12,
        lastUpdated: DateTime.now(),
        articles: [
          Article(
            id: 'sspai_1',
            feedId: 'sspai',
            title: '如何打造一个高效的 RSS 工作流',
            content: '在信息过载的时代，RSS 依然是最好的信息获取方式之一...',
            author: '少数派编辑部',
            publishDate: DateTime.now().subtract(const Duration(days: 1)),
            url: 'https://sspai.com/post/12345',
          ),
          Article(
            id: 'sspai_2',
            feedId: 'sspai',
            title: '新玩意 | 本周值得关注的 10 款新品',
            content: '本周有哪些值得关注的新品发布？让我们一起来看看...',
            author: '少数派编辑部',
            publishDate: DateTime.now().subtract(const Duration(days: 2)),
            url: 'https://sspai.com/post/12346',
          ),
        ],
      ),
      Feed(
        id: 'ifanr',
        title: '爱范儿',
        url: 'https://www.ifanr.com/feed',
        category: '科技',
        unreadCount: 5,
        lastUpdated: DateTime.now(),
        articles: [
          Article(
            id: 'ifanr_1',
            feedId: 'ifanr',
            title: '苹果发布会前瞻：除了 iPhone 15，还有这些新品值得期待',
            content: '一年一度的苹果秋季发布会即将到来...',
            author: '爱范儿编辑部',
            publishDate: DateTime.now().subtract(const Duration(days: 1)),
            url: 'https://www.ifanr.com/12345',
          ),
        ],
      ),
    ],
  ),
  Category(
    id: 'news',
    name: '新闻',
    feeds: [
      Feed(
        id: 'readhub',
        title: 'Readhub',
        url: 'https://readhub.cn/rss',
        category: '新闻',
        unreadCount: 8,
        lastUpdated: DateTime.now(),
        articles: [
          Article(
            id: 'readhub_1',
            feedId: 'readhub',
            title: '今日热点：人工智能发展最新动态',
            content: '人工智能领域今日发生了这些重要事件...',
            author: 'Readhub',
            publishDate: DateTime.now().subtract(const Duration(hours: 6)),
            url: 'https://readhub.cn/topic/12345',
          ),
        ],
      ),
    ],
  ),
];
