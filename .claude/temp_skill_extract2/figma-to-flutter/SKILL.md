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

## 工作流

### 步骤0：输入类型检测

首先判断用户提供的是什么类型的输入：

**A. Figma URL**（如：`figma.com/design/:fileKey/:fileName?node-id=:nodeId`）
→ 进入"步骤1A：Figma多步骤解析"

**B. 图片/截图**
→ 进入"步骤1B：图像分析"

---

### 步骤1A：Figma多步骤解析 ⭐ 关键改进

**问题**：单次调用`get_design_context`可能遗漏元素，导致理解不准确。

**解决方案**：采用渐进式、多工具组合的解析流程，确保完整性。

#### 解析流程（必须严格执行）：

**第一阶段：结构扫描**

```bash
# 获取完整节点树
get_metadata(nodeId)
```

**目的**：了解整体结构，建立"元素清单"

**输出**：
- 有多少个主要组件？
- 层级关系是什么？
- **建立检查清单**：记录所有节点的ID和名称

**自我提问**：
- "我看到了X个节点，让我确保后续解析中找到每一个"

---

**第二阶段：详细解析**

```bash
# 对每个主要区域获取详细信息
get_design_context(nodeId)
```

**目的**：获取每个组件的详细属性和代码建议

**执行**：
- 遍历第一阶段建立的"检查清单"
- 对每个节点获取样式、布局、交互信息
- **特别关注**：get_metadata中提到但get_design_context中未详细说明的部分

**自我提问**：
- "检查清单中的每个节点我都理解了吗？"
- "有没有节点在metadata中存在，但在design_context中没提到？"

---

**第三阶段：视觉验证**

```bash
# 获取设计截图
get_screenshot(nodeId)

# 使用图像分析工具交叉验证
ui_to_artifact或其他图像分析工具
```

**目的**：用视觉方式发现可能遗漏的元素

**执行**：
- 查看截图，识别所有可见元素
- 对比之前的解析结果
- **标记不一致**：视觉中看到但解析中缺失的部分

**自我提问**：
- "截图中显示的元素，我的解析结果中都有吗？"
- "有没有视觉上明显但我没理解的部分？"

---

**第四阶段：交叉验证与补充**

**检查清单**：
- [ ] get_metadata中的所有节点都在design_context中找到了吗？
- [ ] 视觉中看到的所有元素都在解析结果中吗？
- [ ] 是否有未解析的交互状态（hover/active/disabled）？
- [ ] 是否有未解析的变体（variants）？

**如果发现遗漏**：
→ 立即补充解析遗漏的部分
→ 不要等用户提醒

**如果仍然不确定**：
→ 主动标注："这个部分我不太确定，可能需要进一步确认"

---

**第五阶段：输出理解**

完成以上验证后，再进入"步骤1.5：布局理解展示"

#### 关键规则：

1. **不要跳过任何阶段**
2. **用metadata作为"检查清单"**，确保每个节点都被解析
3. **主动发现遗漏**，不要等用户提醒
4. **如果不确定，主动标注**，不要自信地给出错误答案

#### 工具组合策略：

| 工具 | 作用 | 局限性 | 如何克服 |
|------|------|--------|---------|
| `get_metadata` | 获取完整结构 | 没有样式 | 作为"检查清单" |
| `get_design_context` | 获取样式和代码 | 可能遗漏 | 对比metadata，补充遗漏 |
| `get_screenshot` | 视觉验证 | 非结构化 | 用图像分析工具交叉验证 |

---

### 步骤1B：图像分析

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

### Figma MCP工具（重要更新）

当用户提供Figma URL时，必须使用**多工具组合策略**：

```
figma.com/design/:fileKey/:fileName?node-id=:nodeId
```

#### ⚠️ 关键原则：不要只依赖单一工具

**问题**：单个工具不足以获取完整信息
- `get_design_context` 返回的是代码建议，可能遗漏元素
- 只调用一次工具会导致理解不完整

**解决方案**：严格按照"步骤1A：Figma多步骤解析"执行

#### 可用工具及作用：

| 工具 | 获取信息 | 使用场景 |
|------|---------|---------|
| `get_metadata` | 完整节点树（ID、类型、名称、位置） | 第一阶段：建立"检查清单" |
| `get_design_context` | 样式、布局、代码建议 | 第二阶段：获取详细属性 |
| `get_screenshot` | 设计截图 | 第三阶段：视觉验证 |
| `search_design_system` | 设计系统组件 | 可选：查找可复用组件 |

#### 调用顺序：

```
1. get_metadata → 了解结构
2. get_design_context → 获取详情
3. get_screenshot → 视觉验证
4. 对比三者 → 发现遗漏并补充
```

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
- **完整性 > 快速输出**：使用多步骤解析，确保不遗漏任何元素

---

## Figma多步骤解析实战案例

### 案例：登录页面

**用户提供**：Figma URL

#### 错误示范（单次解析）

```markdown
AI: [调用 get_design_context]
AI: 我看到了标题、两个输入框、登录按钮

用户: 你再仔细看看，还有Logo和其他元素

AI: [重新调用 get_design_context]
AI: 啊，确实还有Logo、忘记密码链接...
```

**问题**：
- 浪费时间：来回交互
- 用户体验差：需要不断提醒

#### 正确示范（多步骤解析）

```markdown
AI: [第一阶段] get_metadata → 发现8个节点
AI: 让我逐一解析这8个节点...

AI: [第二阶段] get_design_context → 解析每个节点
    1. Image → Logo ✅
    2. Text → "欢迎回来"标题 ✅
    3. TextField → 邮箱输入框 ✅
    4. TextField → 密码输入框 ✅
    5. ElevatedButton → 登录按钮 ✅
    6. TextButton → 忘记密码？✅
    7. Container → 需要进一步确认
    8. Text → "还没有账号？" ✅

AI: [第三阶段] get_screenshot → 视觉验证
    通过截图确认：Container是背景渐变

AI: [第四阶段] 交叉验证
    ✅ 所有8个节点都已理解
    ✅ 视觉中看到的元素都在解析结果中
    ✅ 没有遗漏

AI: [输出完整的布局理解]
```

**结果**：
- 一次性完整理解
- 用户无需提醒
- 总时间更短

### 关键差异

| 方面 | 单次解析 | 多步骤解析 |
|------|---------|-----------|
| API调用次数 | 1-2次 | 3-4次 |
| 是否遗漏 | 经常遗漏 | 很少遗漏 |
| 需要用户提醒 | 是 | 否 |
| 总时间 | 100秒（含返工） | 60秒（一次完成） |
| 用户体验 | 差 | 好 |

### 自我检查清单

在展示布局理解之前，必须问自己：

- [ ] 我是否用get_metadata建立了完整的节点清单？
- [ ] 清单中的每个节点我都理解了吗？
- [ ] 我是否用get_screenshot进行了视觉验证？
- [ ] 视觉中的元素和我的解析结果一致吗？
- [ ] 是否有任何不确定的部分？
- [ ] 如果有不确定，我主动标注了吗？

---

## 总结

核心改进：
1. ✅ 支持Figma URL输入
2. ✅ 采用多步骤解析流程
3. ✅ 多工具组合（metadata + design_context + screenshot）
4. ✅ 交叉验证和自我检查
5. ✅ 主动发现遗漏，不等用户提醒

记住：**准确性比速度更重要**。多花一点时间确保完整性，总比反复返工要好得多。
