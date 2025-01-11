# Flutter RSS Reader Project Rules

## 1. Technology Stack & Conventions
- Flutter (latest stable version)
- State Management: MobX
  * Store classes must end with 'Store' suffix
  * Use @observable for state variables
  * Use @computed for derived values
  * Use @action for state modifications
  * Stores must be initialized in di/stores.dart
  * Store 负责所有状态管理和生命周期相关的操作

- Dependency Injection: GetIt
  * Use getter methods for dependency injection
  * No constructor injection unless absolutely necessary
  * Register dependencies in di/dependencies.dart
  * Use lazy singletons by default
  * All Repositories and Stores must be registered and accessed through GetIt

- Routing: go_router
  * Define routes in core/router/routes.dart
  * Use GoRoute for all routes
  * Implement custom transitions
  * Use path parameters for dynamic routing
  * Handle deep linking
  * 路由参数传递必须使用 path parameters 或 query parameters
  * 路由跳转时的数据加载和清理必须在 Store 中处理

## 1.1 State Management Rules
- 避免使用 StatefulWidget
  * 使用 MobX Store 管理状态
  * 使用 Observer 组件响应状态变化
  * 页面初始化逻辑放在 Store 中
  * 资源清理逻辑也放在 Store 中

- Store 生命周期管理
  * 在 Store 中定义 init() 方法处理初始化
  * 在 Store 中定义 dispose() 方法处理清理
  * 使用 GoRouter 的 onEnter/onExit hooks 调用 Store 的生命周期方法
  * 长期运行的 Store (如 AppStore) 在 main.dart 中初始化

- 页面组件规范
  * 优先使用 StatelessWidget
  * 使用 Observer 包装需要响应状态变化的组件
  * 页面参数通过路由参数传递
  * 页面初始化和清理通过 Store 处理

- 组件设计原则
  * 组件只负责渲染和用户交互
  * 业务逻辑和状态管理都放在 Store 中
  * 组件通过 GetIt 获取需要的 Store
  * 组件不维护自己的状态

## 1.2 Data Persistence
