# Flutter 响应式布局演示

一个使用 Flutter 开发的响应式布局演示项目，以 RSS 阅读器为原型，展示了多设备适配和状态管理的最佳实践。

## 技术栈

- **状态管理**：MobX
  - 严格的 Model-Store 分离
  - Store 按需创建和缓存
  - 响应式状态更新

- **依赖注入**：GetIt
  - 懒加载单例模式
  - 统一的状态访问

- **路由管理**：go_router
  - 嵌套路由支持
  - 响应式布局路由
  - 深层链接支持

- **本地化**：easy_localization
  - 中文为主要语言
  - 支持英文回退

## 演示重点

- 三级内容层级的响应式布局处理：
  - 移动端（< 600dp）：全屏切换视图
  - 平板（600dp - 1200dp）：双面板布局
  - 桌面端（> 1200dp）：三面板布局
- 状态管理最佳实践：
  - Model 与 Store 严格分离
  - Store 的按需创建和缓存
  - 响应式状态更新
- 路由与布局的协同：
  - 不同设备尺寸下的路由策略
  - 布局状态的持久化
  - 深层链接支持

## 其他特性

- 支持深色模式
- 字体大小调节
- 手势导航支持
- 键盘快捷键（桌面端）

## 数据结构

### 分类 (Category)
```dart
class Category {
  final String id;
  final String name;
  List<Feed> feeds;
}
```

### 订阅源 (Feed)
```dart
class Feed {
  final String id;
  final String title;
  final String url;
  final String? iconUrl;
  final String category;
  int unreadCount;
  DateTime lastUpdated;
  List<Article> articles;
}
```

### 文章 (Article)
```dart
class Article {
  final String id;
  final String feedId;
  final String title;
  final String content;
  final String? author;
  final DateTime publishDate;
  final String url;
  bool isRead;
  bool isStarred;
}
```

## 布局适配

### 移动端视图 (< 600dp)
- 抽屉式订阅源列表
- 全屏文章列表
- 全屏文章内容
- 支持手势返回
- 底部导航栏快速访问

### 平板视图 (600dp - 1200dp)
- 可折叠的侧边栏（240dp）
- 固定宽度的文章列表（320dp）
- 自适应宽度的文章内容
- 平滑的展开/折叠动画

### 桌面视图 (> 1200dp)
- 三栏布局
- 固定宽度的订阅源列表（240dp）
- 固定宽度的文章列表（320dp）
- 自适应宽度的文章内容
- 支持键盘快捷键

## 演示数据

项目包含了模拟数据用于演示：

- 科技分类
  - 少数派（12 条未读）
  - 爱范儿（5 条未读）
- 新闻分类
  - Readhub（8 条未读）

每个订阅源都包含示例文章，展示了标题、作者、发布日期、内容等完整信息。

## 开发

1. 确保已安装 Flutter（最新稳定版）
2. 克隆项目
3. 安装依赖：
   ```bash
   flutter pub get
   ```
4. 生成代码（仅限 stores 目录）：
   ```bash
   flutter pub run build_runner build
   ```
5. 运行项目：
   ```bash
   flutter run
   ```

## 项目结构

```
lib/
  ├── core/          # 核心功能
  │   ├── router/    # 路由配置
  │   ├── di/        # 依赖注入
  │   └── theme/     # 主题配置
  ├── features/      # 功能模块
  │   ├── home/      # 主页面
  │   ├── settings/  # 设置
  │   └── feed_management/  # 订阅源管理
  ├── models/        # 数据模型
  ├── stores/        # 状态管理
  └── shared/        # 共享组件
```

## 注意事项

- 项目使用了 `build.yaml` 限制代码生成范围，只在 `lib/stores` 目录运行 MobX 生成器
- Model 和 Store 严格分离，确保数据结构的纯粹性
- 响应式布局采用 Flutter 的 LayoutBuilder，确保流畅的布局切换
- 使用 mock 数据进行开发和测试，可以方便地替换为实际的 RSS 数据源
