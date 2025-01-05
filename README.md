# FlexFrame - Flutter自适应框架演示

一个展示Flutter自适应布局和最佳实践的示例项目。

## 功能特点

- 响应式布局
  - 手机端：单列布局+抽屉式导航
  - 平板端：可折叠一级导航+固定二级导航
  - 桌面端：固定显示一级和二级导航

- 三级导航结构
  - 模块/分区/详情
  - URL同步
  - 深度链接支持

- 页面类型
  - 带加载动画的启动页
  - 带表单验证的登录页
  - 带统计卡片的仪表盘
  - 带搜索和筛选的列表页
  - 带标签页的详情页
  - 带主题切换的设置页

## 技术栈

- Flutter 3.x
- go_router (路由管理)
- get_it (依赖注入)
- mobx (状态管理)
- easy_localization (国际化)
- flex_color_scheme (主题)

## 项目结构

```
/lib
  /core
    /di          - 依赖注入
    /router      - 路由配置
    /theme       - 主题配置
  /features
    /auth        - 认证
    /dashboard   - 仪表盘
    /list        - 列表视图
    /detail      - 详情视图
    /settings    - 设置
  /models        - 数据模型
  /stores        - MobX状态管理
  /widgets       - 共享组件
  /utils         - 工具类
```

## 开始使用

1. 克隆项目
```bash
git clone https://github.com/yourusername/flutter_flex_frame.git
```

2. 安装依赖
```bash
flutter pub get
```

3. 生成必要的代码
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. 运行项目
```bash
flutter run
```

## 特性

- 清晰的项目架构
- 完善的错误处理
- 异步操作的加载状态
- 平滑的导航动画
- 主题支持（明/暗）
- 表单验证
- 响应式设计
- 中英文国际化

## 贡献

欢迎提交 Issue 和 Pull Request。

## 许可证

MIT License

---

## 与AI助手的对话


```
按照以下提示词创建项目， 所有已有代码都可以删除， 
Project: FlexFrame - A Flutter Adaptive Framework Demo
项目：FlexFrame - Flutter自适应框架演示

Technical Stack 技术栈:
- Flutter 3.x
- go_router (路由管理)
- get_it (依赖注入)
- mobx (状态管理)

Core Features 核心功能:
1. Responsive Layout 响应式布局
   - Mobile: Single column with drawer navigation
     手机端：单列布局+抽屉式导航
   - Tablet: Collapsible primary nav + fixed secondary nav
     平板端：可折叠一级导航+固定二级导航
   - Desktop: Fixed primary and secondary navigation
     桌面端：固定显示一级和二级导航

2. Navigation Structure 导航结构
   - Three-level navigation (Module/Section/Detail)
     三级导航（模块/分区/详情）
   - URL synchronization
     URL同步
   - Deep linking support
     深度链接支持

3. Page Types 页面类型
   - Splash screen with loading animation
     带加载动画的启动页
   - Login page with form validation
     带表单验证的登录页
   - Dashboard with statistics cards
     带统计卡片的仪表盘
   - List page with search and filters
     带搜索和筛选的列表页
   - Detail page with tabs
     带标签页的详情页
   - Settings page with theme switching
     带主题切换的设置页

4. State Management 状态管理
   - Authentication state
     认证状态
   - Navigation state
     导航状态
   - Theme state
     主题状态
   - List filters state
     列表筛选状态

5. Mock Data 模拟数据
   - User data
     用户数据
   - List items data
     列表项数据
   - Dashboard statistics
     仪表盘统计数据

Project Structure 项目结构:
/lib
  /core
    /di          - Dependency injection
    /router      - Router configuration
    /theme       - Theme configuration
  /features
    /auth        - Authentication
    /dashboard   - Dashboard
    /list        - List view
    /detail      - Detail view
    /settings    - Settings
  /models        - Data models
  /stores        - MobX stores
  /widgets       - Shared widgets
  /utils         - Utilities

Requirements 具体要求:
1. Clean Architecture principles
   遵循清洁架构原则
2. Proper error handling
   完善的错误处理
3. Loading states for async operations
   异步操作的加载状态
4. Smooth animations for navigation
   平滑的导航动画
5. Theme support (light/dark)
   主题支持（明/暗）
6. Form validation
   表单验证
7. Proper state management
   合理的状态管理
8. Responsive design
   响应式设计
9. Code comments and documentation
   代码注释和文档

Additional Features 额外功能:
1. Localization support
   本地化支持
2. Error boundaries
   错误边界处理
3. Analytics tracking
   分析追踪
4. Unit tests
   单元测试
5. Performance optimization
   性能优化

This project serves as a template for Flutter applications requiring adaptive layouts and robust state management.
本项目作为需要自适应布局和强大状态管理的Flutter应用模板。
```
```
国际化改用easy_localization，看看该改什么就改，包括项目整体结构， 
dev依赖的melos保留一下，
```
```
更新README.md，末尾的代码块是和AI的对话保留，其他重写，用中文，你看着来，
```