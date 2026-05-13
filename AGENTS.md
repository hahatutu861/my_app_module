# Flutter 像素级还原 UI 代码生成指南 (Project Rules)

## 任务目标
严格遵循现有项目代码风格，生成高质量、可直接使用的 Flutter 页面代码。

## 参考标准
请严格参照以下文件作为代码风格模板：
- /Users/tulei/Documents/flutter/my_app_module/lib/views/wifi_map/edit_room_bottom_sheet.dart

---

## 技术规范

### 1. 基础环境
- 框架：Material3
- 适配方案：flutter_screenutil，基准宽度 375px
- 尺寸后缀：`.w`（宽度）、`.h`（高度）、`.sp`（字号）

### 2. 数据源优先级
- **第一优先级**：Figma 导出的 JSON（所有数值、颜色、间距、圆角）
- **第二优先级**：设计稿截图（仅用于布局结构识别）

---

## 代码风格强制规范

### 导入语句顺序
```
// 1. Flutter 内置包
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// 2. 第三方包（按字母/重要性排序）
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 3. 项目内部包（按目录层级，从外到内）
import 'package:my_app_module/utils/design/app_spacing.dart';
import 'package:my_app_module/widgets/hint_text_field.dart';
import 'package:my_app_module/viewmodels/xxx_provider.dart';
import '../../utils/build_context_extension.dart';
```

### Widget 结构规范

#### 主组件模板
```dart
class XxxPage extends ConsumerWidget {
  const XxxPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(xxxProvider);
    final viewModel = ref.read(xxxProvider.notifier);
    
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context),
          _buildContent(context, state, viewModel),
          _buildFooter(context, state, viewModel),
        ],
      ),
    );
  }

  // ===== 私有构建方法 =====
  
  Widget _buildHeader(BuildContext context) { ... }
  
  Widget _buildContent(BuildContext context, XxxState state, XxxViewModel viewModel) { ... }
  
  Widget _buildFooter(BuildContext context, XxxState state, XxxViewModel viewModel) { ... }
}
```

### 方法拆分原则
- **每个视觉区块** → 一个独立的 `_buildXxx` 方法
- **每个可复用组件** → 抽离为独立 Widget 文件
- **状态需要时** → 通过参数显式传递（`state`, `viewModel`）

### 容器与装饰规范
```dart
// 标准容器写法
Container(
  padding: EdgeInsets.all(AppSpacing.pad16.w),
  decoration: BoxDecoration(
    color: context.appColors.fontWh1with100Opacity,
    border: Border.all(
      color: context.appColors.gray3,
      width: 1.w,
    ),
    borderRadius: BorderRadius.circular(8.r),
  ),
  child: ChildWidget(),
)

// 条件样式（选中态）
Container(
  decoration: BoxDecoration(
    color: isSelected 
        ? context.appColors.brand1Light 
        : context.appColors.fontWh1with100Opacity,
  ),
)
```

### 布局原则
- **优先使用**：Column / Row + MainAxisAlignment / CrossAxisAlignment
- **避免使用**：Stack + Positioned（除非无法用 AutoLayout 实现）
- **列表布局**：ListView.builder（大数据量）/ Column（固定数量）
- **网格布局**：GridView.count（固定列数）/ GridView.builder

### 样式访问规范
```dart
// 颜色
context.appColors.brand6Normal
context.appColors.error6Normal
context.appColors.gray3

// 文字样式
context.appTextStyles.titleWith90Opacity
context.appTextStyles.bodyWith90Opacity
context.appTextStyles.buttonPrimary
context.appTextStyles.captionWith90Opacity
context.appTextStyles.labelWith90Opacity
context.appTextStyles.subtitleWith60Opacity

// 间距常量
AppSpacing.pad16.w
AppSpacing.gap8.w
AppSpacing.pad24.w

// 国际化
context.l10n.roomNameLabel
context.l10n.save
context.l10n.deleteZoneRoom
```

### 交互组件规范
```dart
// 点击手势
GestureDetector(
  onTap: () => viewModel.selectRoom(room),
  child: Container(...),
)

// 按钮
ElevatedButton(
  onPressed: () { ... },
  style: ElevatedButton.styleFrom(
    backgroundColor: context.appColors.brand6Normal,
    foregroundColor: context.appColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100.r),
    ),
    elevation: 0,
  ),
  child: Text(...),
)
```

---

## 输出要求

1. **只输出 Dart 代码**，不输出解释性文字
2. 代码必须包含：
   - 完整的页面主文件
   - 必要的导入语句
   - 全局样式常量（如需要）
3. 禁止事项：
   - 禁止添加注释
   - 禁止硬编码颜色值（必须使用 context.appColors）
   - 禁止硬编码尺寸数值（必须使用 .w/.h 后缀）
   - 禁止省略类型声明
