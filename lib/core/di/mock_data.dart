import '../../models/article.dart';
import '../../models/category.dart';
import '../../models/feed.dart';

final mockCategories = [
  Category(
    id: 'tech',
    name: '科技',
  )..setFeeds([
      Feed(
        id: 'sspai',
        title: '少数派',
        url: 'https://sspai.com/feed',
        iconUrl: 'https://cdn.sspai.com/sspai/logo.png',
        category: 'tech',
        lastUpdated: DateTime.now(),
      )..setArticles([
          Article(
            id: 'article1',
            feedId: 'sspai',
            title: '如何打造一个高效的 RSS 工作流',
            content: '''
# 如何打造一个高效的 RSS 工作流

RSS（Really Simple Syndication）是一种消息来源格式规范，用以聚合经常发布更新数据的网站，例如博客文章、新闻、音频或视频的网摘。

## 为什么选择 RSS

1. 信息聚合：将所有关注的内容集中在一处
2. 时间管理：自主选择阅读时间
3. 去除干扰：没有广告和推荐算法的干扰

## 选择合适的 RSS 阅读器

市面上有很多优秀的 RSS 阅读器，比如：

- Feedly
- Inoreader
- NetNewsWire

## 构建信息源

1. 技术博客
2. 新闻媒体
3. 独立博客
4. YouTube 频道

## 阅读策略

1. 设置固定的阅读时间
2. 使用标签系统分类
3. 及时清理无用订阅

## 总结

一个好的 RSS 工作流可以帮助我们更高效地获取和处理信息，避免信息过载。
''',
            publishDate: DateTime.now().subtract(const Duration(hours: 2)),
            url: 'https://sspai.com/post/12345',
            author: '少数派',
          ),
          Article(
            id: 'article2',
            feedId: 'sspai',
            title: 'RSS 订阅源推荐',
            content: '''
# RSS 订阅源推荐

本文将为大家推荐一些优质的 RSS 订阅源。

## 科技类

1. 少数派
2. 极客公园
3. 36氪

## 新闻类

1. BBC
2. Reuters
3. AP News

## 设计类

1. Dribbble
2. Behance
3. UI Movement

## 独立博客

1. Paul Graham
2. Joel on Software
3. DHH

希望这些推荐能帮助你扩展信息来源！
''',
            publishDate: DateTime.now().subtract(const Duration(hours: 4)),
            url: 'https://sspai.com/post/12346',
            author: '少数派编辑部',
          ),
        ]),
      Feed(
        id: 'ifanr',
        title: '爱范儿',
        url: 'https://www.ifanr.com/feed',
        iconUrl: 'https://cdn.ifanr.com/ifanr/logo.png',
        category: 'tech',
        lastUpdated: DateTime.now(),
      )..setArticles([
          Article(
            id: 'article3',
            feedId: 'ifanr',
            title: '苹果发布会前瞻',
            content: '''
# 苹果发布会前瞻

又到了一年一度的苹果秋季发布会，让我们来预测一下今年会发布哪些新品。

## iPhone 15 系列

- 全系 USB-C 接口
- Pro 系列采用钛金属边框
- 灵动岛全系标配

## Apple Watch Series 9

- 新增健康监测功能
- 电池续航提升
- 全新表带设计

## 其他可能的新品

1. AirPods Pro 3
2. 新款 iPad
3. M3 芯片 Mac

让我们拭目以待！
''',
            publishDate: DateTime.now().subtract(const Duration(hours: 6)),
            url: 'https://www.ifanr.com/12345',
            author: '爱范儿',
          ),
        ]),
    ]),
  Category(
    id: 'news',
    name: '新闻',
  )..setFeeds([
      Feed(
        id: 'readhub',
        title: 'Readhub',
        url: 'https://readhub.cn/rss',
        category: 'news',
        lastUpdated: DateTime.now(),
      )..setArticles([
          Article(
            id: 'article4',
            feedId: 'readhub',
            title: '今日科技要闻',
            content: '''
# 今日科技要闻

## AI 领域最新进展

OpenAI 发布了最新的大语言模型，性能较前代提升显著。

## 科技公司动态

1. 谷歌推出新的开发者工具
2. 微软收购游戏工作室
3. Meta 发布 VR 新品

## 创业公司融资消息

several startups raised significant funding...

## 市场分析

analysis of current market trends...
''',
            publishDate: DateTime.now().subtract(const Duration(hours: 1)),
            url: 'https://readhub.cn/12345',
          ),
        ]),
    ]),
];
