---
name: figma-to-flutter
description: 从Figma设计稿生成高质量Flutter UI代码。当用户提供Figma设计截图、设计稿图片或UI设计时触发，自动分析视觉元素、识别UI模式、映射到项目设计系统，生成符合Clean Architecture和最佳实践的Flutter代码。支持：颜色映射到AppColors、字体映射到Theme、使用语义化组件、国际化、暗色模式、可访问性。
---

# Figma To Flutter

## 核心原则

**质量优先，而非速度**：生成的代码必须：
- 映射到项目设计系统（AppColors、Theme）
- 使用语义化组件（ElevatedButton而非Container+Text）
- 支持国际化和暗色模式
- 符合Clean Architecture规范
- 可维护、可扩展

---

## ⭐ 项目特定规范（重要！）

本项目有特定的代码风格，**必须遵守**：

### 状态栏处理

**❌ 不要这样做：**
```dart
SafeArea(
  child: Scaffold(...),
)
```

**✅ 必须这样做：**
```dart
Scaffold(
  body: Column(
    children: [
      SizedBox(height: statusBarHeight),  // 处理状态栏
      // 其他内容
    ],
  ),
)
```

**获取状态栏高度：**
```dart
final statusBarHeight = MediaQuery.of(context).padding.top;
```

**理由**：与项目中其他页面（如 `home_network_page.dart`）保持一致的风格。

### 参考

参考文件：
- `lib/features/home_network/presentation/pages/home_network_page.dart`
- `lib/features/home_network/presentation/widgets/custom_app_bar.dart`

### 其他项目规范

- 颜色系统：使用 `context.appColors.*`
- 间距系统：使用 `AppSpacing.*` 和 `Spacing.*`
- 图标：使用 `AppImage()` 组件

---

## 工作流

### 步骤1：视觉分析

使用图像分析工具识别：

**UI元素识别**：
- 按钮（主按钮/次按钮/轮廓按钮/文本按钮）
- 文本（标题/副标题/正文/说明）
- 输入框（文本/密码/邮箱等）
- 图片/图标
- 卡片/列表/表单等复合组件

**UI模式识别**：
- 列表（ListView/GridView）
- 卡片（Card）
- 表单（Form）
- 导航栏（AppBar/BottomNavigationBar）
- 弹出层（Dialog/BottomSheet）

**设计属性提取**：
- 颜色值（十六进制）
- 字体大小、字重
- 间距、边距
- 圆角、阴影
- 渐变色

### 步骤2：项目上下文分析

**读取项目代码**：
```bash
# 必须读取的文件
lib/core/design/app_colors.dart
lib/shared/ui/theme/app_theme.dart
lib/features/*/presentation/pages/*.dart
pubspec.yaml
```

**识别项目特性**：
- 设计系统（颜色、字体、间距）
- 状态管理（Riverpod/Provider/Bloc）
- 路由系统（GoRouter/AutoRouter）
- 国际化方案（l10n）
- 自定义组件库

### 步骤3：语义映射

**颜色映射规则**：

```dart
// Figma中的主色 #0572E6
// ❌ 不要硬编码
color: Color(0xFF0572E6)

// ✅ 映射到AppColors
import 'package:my_app_module/core/design/app_colors.dart';
color: Color(AppColors.brand6Normal)

// ✅ 或使用Theme
color: Theme.of(context).colorScheme.primary
```

**字体映射规则**：

```dart
// Figma中的样式：24px SemiBold
// ❌ 不要硬编码
style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)

// ✅ 映射到Theme
style: Theme.of(context).textTheme.displaySmall
```

**间距建议**（当前项目可能需要补充）：

```dart
// 建议建立间距令牌系统
class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
}
```

### 步骤4：组件选择

**优先级顺序**：

1. **检查Figma组件定义**
   - 如果使用Figma MCP工具，检查是否有Code Connect映射
   - 读取组件的variants、properties、documentation

2. **检查项目现有组件**
   - 搜索 `lib/shared/ui/widgets/` 或 `lib/shared/widgets/`
   - 查找自定义组件（如AppButton、AppCard）

3. **使用Material组件**
   - 按钮类：ElevatedButton、TextButton、OutlinedButton
   - 输入类：TextField、TextFormField、Checkbox、Switch
   - 布局类：Card、ListView、GridView
   - 导航类：AppBar、BottomNavigationBar、TabBar

4. **自定义组件**（仅当前3种都不适用时）
   - 使用Container + Decoration
   - 使用自定义Painter

### 步骤5：代码生成

**生成规则**：

```dart
// ✅ 标准模板
class FeaturePage extends ConsumerWidget {
  const FeaturePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.pageTitle),
      ),
      body: // ...
    );
  }
}
```

**必须遵循**：
1. 使用 `ConsumerWidget`（Riverpod项目）
2. 使用国际化：`context.l10n.*`
3. 使用语义化组件
4. 避免硬编码颜色、字体、间距
5. 考虑可访问性（Semantics Widget）

### 步骤6：质量检查

**检查清单**：
- [ ] 颜色映射到AppColors或Theme？
- [ ] 字体映射到Theme.textTheme？
- [ ] 使用国际化字符串？
- [ ] 支持暗色模式（通过Theme自动切换）？
- [ ] 响应式布局（不使用固定宽度）？
- [ ] 可访问性（Semantic Widget）？
- [ ] 代码符合项目架构？

## 常见UI模式示例

### 登录页面

```dart
class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(AppColors.brand1Light),
              Color(AppColors.white),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  const AppImage.asset(
                    'assets/images/logo.png',
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(height: 24),

                  // 标题
                  Text(
                    context.l10n.welcomeBack,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 8),

                  // 副标题
                  Text(
                    context.l10n.loginPrompt,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32),

                  // 邮箱输入框
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: context.l10n.emailHint,
                      labelText: context.l10n.email,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 密码输入框
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: context.l10n.passwordHint,
                      labelText: context.l10n.password,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 登录按钮
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                    ),
                    child: Text(context.l10n.login),
                  ),
                  const SizedBox(height: 16),

                  // 忘记密码链接
                  TextButton(
                    onPressed: () {},
                    child: Text(context.l10n.forgotPassword),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

### 卡片列表

```dart
class ItemListPage extends ConsumerWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.items),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Card(
              child: ListTile(
                leading: AppImage.asset(item.icon),
                title: Text(item.name),
                subtitle: Text(item.description),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  // 导航到详情页
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
```

## 工具集成

### Figma MCP工具

当用户提供Figma URL时，优先使用Figma MCP工具：

```
figma.com/design/:fileKey/:fileName?node-id=:nodeId
```

可用工具：
- `get_design_context` - 获取设计上下文和代码建议
- `get_screenshot` - 获取节点截图
- `get_metadata` - 获取节点元数据
- `search_design_system` - 搜索设计系统组件

### 图像分析工具

当用户提供截图时，使用：
- `mcp__zai-vision__ui_to_artifact` - UI转代码
- `mcp__figma-remote-mcp__get_design_context` - 如果是Figma截图

## 反例模式（避免）

### ❌ 错误示例1：硬编码颜色

```dart
Container(
  color: Color(0xFF0572E6), // ❌ 硬编码
)
```

### ✅ 正确示例1

```dart
Container(
  color: Color(AppColors.brand6Normal), // ✅ 映射到设计系统
)
```

### ❌ 错误示例2：硬编码字体

```dart
Text(
  '标题',
  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600), // ❌
)
```

### ✅ 正确示例2

```dart
Text(
  context.l10n.title, // ✅ 国际化
  style: Theme.of(context).textTheme.displaySmall, // ✅ 主题
)
```

### ❌ 错误示例3：使用Container而非语义化组件

```dart
GestureDetector(
  onTap: () {},
  child: Container(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    decoration: BoxDecoration(
      color: Color(AppColors.brand6Normal),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text('提交', style: TextStyle(color: Colors.white)),
  ), // ❌ 应该用ElevatedButton
)
```

### ✅ 正确示例3

```dart
ElevatedButton(
  onPressed: () {},
  child: Text(context.l10n.submit), // ✅ 语义化组件
)
```

## 项目配置建议

### 建议补充：间距令牌系统

在 `lib/core/design/` 下创建 `app_spacing.dart`：

```dart
class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  static const EdgeInsets allXs = EdgeInsets.all(xs);
  static const EdgeInsets allSm = EdgeInsets.all(sm);
  static const EdgeInsets allMd = EdgeInsets.all(md);
  static const EdgeInsets allLg = EdgeInsets.all(lg);

  static const EdgeInsets symHSmVXs = EdgeInsets.symmetric(horizontal: sm, vertical: xs);
  static const EdgeInsets symHMdVSm = EdgeInsets.symmetric(horizontal: md, vertical: sm);
  static const EdgeInsets symHLgVMd = EdgeInsets.symmetric(horizontal: lg, vertical: md);
}
```

### 建议补充：常用自定义组件

在 `lib/shared/ui/widgets/` 下创建：

- `AppButton` - 统一的按钮组件
- `AppCard` - 统一的卡片组件
- `AppImage` - 统一的图片组件
- `AppTextField` - 统一的输入框组件

## 执行优先级

1. **理解项目**：先读取项目代码，理解架构和设计系统
2. **分析图片**：使用图像工具识别UI元素和模式
3. **映射设计系统**：颜色、字体、间距映射
4. **生成代码**：按照最佳实践生成代码
5. **质量检查**：对照检查清单验证

## 注意事项

- **质量 > 速度**：宁可多花时间理解项目，也不要生成低质量代码
- **复用 > 创建**：优先使用项目现有组件
- **语义 > 视觉**：理解设计意图，而不只是像素
- **可维护性 > 简洁性**：多写几行清晰的代码，少写一行晦涩的代码
