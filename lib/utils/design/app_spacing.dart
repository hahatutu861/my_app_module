/// 应用间距配置
///
/// 设计系统间距常量（无框架依赖）
/// 基于 4pt 栅格系统，根据项目实际设计规范定制
///
/// 架构说明：
/// - 此类属于 Core Layer，不依赖任何框架
/// - 使用 double 存储间距值，保持跨平台一致性
/// - 命名规则：{用途}{尺寸}
///   - 尺寸：4, 8, 12, 16, 20, 24, 30
///   - 用途：gap(组件间距), pad(内边距), margin(外边距)
library;

/// 间距令牌常量
///
/// 基于 4pt 栅格系统的设计令牌
/// 根据项目实际使用情况定制：4, 8, 12, 16, 20, 24, 30
class AppSpacing {
  AppSpacing._();

  // ============== 基础间距令牌 ==============
  /// 极小间距 - 2pt
  /// 用于：极小元素间距
  static const double s2 = 2.0;

  /// 极小间距 - 3pt
  /// 用于：房间数量标签垂直内边距
  static const double s3 = 3.0;

  /// 极小间距 - 4pt
  /// 用于：小元素间距（图标与文字、编辑按钮与文本）
  static const double s4 = 4.0;

  /// 中小间距 - 8pt
  /// 用于：基础间距单位
  static const double s8 = 8.0;

  /// 中小间距 - 10pt
  /// 用于：房间数量标签水平内边距
  static const double s10 = 10.0;

  /// 中小间距 - 12pt
  /// 用于：ActionSection 内部按钮和文字间距
  static const double s12 = 12.0;

  /// 中间距 - 16pt（默认间距）
  /// 用于：页面容器内边距、AppBar 水平内边距
  static const double s16 = 16.0;

  /// 中大间距 - 20pt
  /// 用于：ActionSection 顶部内边距
  static const double s20 = 20.0;

  /// 大间距 - 24pt
  /// 用于：ProgressSection 内部间距、完成按钮水平内边距
  static const double s24 = 24.0;

  /// 超大间距 - 30pt
  /// 用于：主页面主要区块间距
  static const double s30 = 30.0;

  // ============== 组件间距 (Gaps) ==============
  /// 极小间隙 - 4pt
  /// 用于：设备指示器和信息间距、文字和编辑按钮间距
  static const double gap4 = 4.0;

  /// 小间隙 - 8pt
  static const double gap8 = 8.0;

  /// 中小间隙 - 12pt
  /// 用于：按钮和文字之间的间距
  static const double gap12 = 12.0;

  /// 中间隙 - 16pt
  static const double gap16 = 16.0;

  /// 大间隙 - 24pt
  /// 用于：组件内部元素间距
  static const double gap24 = 24.0;

  /// 超大间隙 - 30pt
  /// 用于：主要区块之间的间距
  static const double gap30 = 30.0;

  // ============== 内边距 (Padding) ==============
  /// 小内边距 - 4pt
  static const double pad4 = 4.0;

  /// 中小内边距 - 8pt
  static const double pad8 = 8.0;

  /// 中内边距 - 12pt
  static const double pad12 = 12.0;

  /// 标准内边距 - 16pt
  /// 用于：页面容器内边距、AppBar 水平内边距
  static const double pad16 = 16.0;

  /// 中大内边距 - 20pt
  /// 用于：ActionSection 顶部内边距
  static const double pad20 = 20.0;

  /// 大内边距 - 24pt
  /// 用于：完成按钮的水平内边距
  static const double pad24 = 24.0;

  /// 超大内边距 - 32pt
  static const double pad32 = 32.0;

  /// 超大内边距 - 40pt
  /// 用于：空状态文案的水平内边距
  static const double pad40 = 40.0;

  /// 超大内边距 - 64pt
  static const double pad64 = 64.0;

  // ============== 外边距 (Margin) ==============
  /// 小外边距 - 4pt
  static const double margin4 = 4.0;

  /// 标准外边距 - 16pt
  static const double margin16 = 16.0;

  /// 大外边距 - 24pt
  static const double margin24 = 24.0;

  // ============== 圆角半径 (Border Radius) ==============
  /// 小圆角 - 3pt
  /// 用于：房间数量标签圆角
  static const double radius3 = 3.0;

  /// 小圆角 - 4pt
  /// 用于：进度条圆角
  static const double radius4 = 4.0;

  /// 中圆角 - 5pt
  /// 用于：气泡提示圆角
  static const double radius5 = 5.0;

  /// 完全圆形 - 100pt
  /// 用于：完成按钮、圆形按钮
  static const double radiusFull = 100.0;

  // ============== 图标尺寸 ==============
  /// 小图标 - 14pt
  /// 用于：小尺寸图标
  static const double icon14 = 14.0;

  /// 中图标 - 16pt
  /// 用于：中等尺寸图标
  static const double icon16 = 16.0;

  /// 标准图标 - 24pt（默认图标尺寸）
  /// 用于：返回、关闭、编辑按钮图标
  static const double icon24 = 24.0;

  // ============== 组件尺寸 ==============
  /// 标准按钮高度 - 48pt
  /// 用于：完成按钮、主要操作按钮
  static const double buttonHeight = 48.0;

  /// 进度条高度 - 8pt
  static const double progressBarHeight = 8.0;

  // ============== 特殊用途 ==============
  /// 零间距
  static const double zero = 0.0;

  /// 标准分割线高度 - 1pt
  static const double divider = 1.0;

  /// 标准边框宽度 - 1pt
  static const double border = 1.0;

  /// 粗边框宽度 - 2pt
  static const double borderThick = 2.0;
}
