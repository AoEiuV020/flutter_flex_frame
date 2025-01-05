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

## 演示账号

项目提供两个演示账号：

1. 管理员账号
   - 用户名：admin
   - 密码：admin123

2. 普通用户账号
   - 用户名：demo
   - 密码：demo123

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

[AI.md](AI.md)
