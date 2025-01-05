
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
> 国际化改用easy_localization，看看该改什么就改，包括项目整体结构，
dev依赖的melos保留一下，

> 更新README.md，末尾的代码块是和AI的对话保留，其他重写，用中文，你看着来，

> google fonts需要下载， 有些平台好像需要手动声明网络权限，你给我检查一下各平台代码， 帮我都加上网络权限，

> 点登录就没然后了，你怎么搞的，登录成功失败都没有，如果需要账号密码， 在readme中体现一下，

> 点登录就没然后了，你怎么搞的，登录成功失败都没有，如果需要账号密码， 在readme中体现一下，

> 列表页信息都没有正确显示， 显示了花括号，点击就崩溃了，
_TypeError (type 'List<dynamic>' is not a subtype of type 'List<Widget>')
 检查修复一下， 

```
完全没有变化， 你对国际化tr的用法是不是有问题， 
报错没变， 
The following _TypeError was thrown building DetailPage(dirty, dependencies: [InheritedCupertinoTheme, _InheritedTheme, _LocalizationsScope-[GlobalKey#5b6da]], state: _DetailPageState#f3a5a(ticker inactive)):
type 'List<dynamic>' is not a subtype of type 'List<Widget>'

The relevant error-causing widget was:
    DetailPage DetailPage:file:///Users/aoeiuv/git/flutter_flex_frame/lib/core/router/app_router.dart:49:38

When the exception was thrown, this was the stack:
#0      _DetailPageState._buildStatsTab (package:flutter_flex_frame/features/detail/detail_page.dart:196:10)
detail_page.dart:196
#1      _DetailPageState.build (package:flutter_flex_frame/features/detail/detail_page.dart:118:23)
detail_page.dart:118
```
```
tr用法完全不对，报错了，你是不是瞎改， 
The following NoSuchMethodError was thrown building DetailPage(dirty, state: _DetailPageState#17ab5(ticker inactive)):
Class 'String' has no instance method 'tr'.
Receiver: "detail.title"
Tried calling: tr()

The relevant error-causing widget was:
    DetailPage DetailPage:file:///Users/aoeiuv/git/flutter_flex_frame/lib/core/router/app_router.dart:49:38

When the exception was thrown, this was the stack:
#0      Object.noSuchMethod (dart:core-patch/object_patch.dart:38:5)
object_patch.dart:38
#1      _DetailPageState.build (package:flutter_flex_frame/features/detail/detail_page.dart:79:50)
detail_page.dart:79
```
> 点击可以了， 但显示还是不对， 会显示{number}{id}

> 就一个参数就别用什么占位符了， 全部代码检查一下，别犯同样的错误，

