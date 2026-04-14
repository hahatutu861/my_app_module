import 'package:flutter/widgets.dart';
import 'app_spacing.dart';

/// Widget 间距扩展
///
/// 为 Widget 提供链式调用的间距方法
/// 使用方式：`Container().paddingAll16().marginBottom4()`
extension AppSpacingWidgetExtension on Widget {
  // ============== 全方向内边距 ==============

  /// 极小内边距 (4pt) - 所有方向
  Widget paddingAll4() => Padding(
        padding: const EdgeInsets.all(AppSpacing.pad4),
        child: this,
      );

  /// 小内边距 (8pt) - 所有方向
  Widget paddingAll8() => Padding(
        padding: const EdgeInsets.all(AppSpacing.pad8),
        child: this,
      );

  /// 中小内边距 (12pt) - 所有方向
  Widget paddingAll12() => Padding(
        padding: const EdgeInsets.all(AppSpacing.pad12),
        child: this,
      );

  /// 标准内边距 (16pt) - 所有方向
  Widget paddingAll16() => Padding(
        padding: const EdgeInsets.all(AppSpacing.pad16),
        child: this,
      );

  /// 中大内边距 (20pt) - 所有方向
  Widget paddingAll20() => Padding(
        padding: const EdgeInsets.all(AppSpacing.pad20),
        child: this,
      );

  /// 大内边距 (24pt) - 所有方向
  Widget paddingAll24() => Padding(
        padding: const EdgeInsets.all(AppSpacing.pad24),
        child: this,
      );

  // ============== 水平内边距 ==============

  /// 小水平内边距 (8pt)
  Widget paddingHorizontal8() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pad8),
        child: this,
      );

  /// 标准水平内边距 (16pt)
  Widget paddingHorizontal16() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pad16),
        child: this,
      );

  /// 大水平内边距 (24pt)
  Widget paddingHorizontal24() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pad24),
        child: this,
      );

  // ============== 垂直内边距 ==============

  /// 极小垂直内边距 (4pt)
  Widget paddingVertical4() => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.pad4),
        child: this,
      );

  /// 小垂直内边距 (8pt)
  Widget paddingVertical8() => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.pad8),
        child: this,
      );

  /// 中小垂直内边距 (12pt)
  Widget paddingVertical12() => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.pad12),
        child: this,
      );

  /// 标准垂直内边距 (16pt)
  Widget paddingVertical16() => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.pad16),
        child: this,
      );

  /// 中大垂直内边距 (20pt)
  Widget paddingVertical20() => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.pad20),
        child: this,
      );

  /// 大垂直内边距 (24pt)
  Widget paddingVertical24() => Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.pad24),
        child: this,
      );

  // ============== 单方向内边距 ==============

  /// 顶部内边距 - 极小 (4pt)
  Widget paddingTop4() => Padding(
        padding: const EdgeInsets.only(top: AppSpacing.pad4),
        child: this,
      );

  /// 顶部内边距 - 小 (8pt)
  Widget paddingTop8() => Padding(
        padding: const EdgeInsets.only(top: AppSpacing.pad8),
        child: this,
      );

  /// 顶部内边距 - 中小 (12pt)
  Widget paddingTop12() => Padding(
        padding: const EdgeInsets.only(top: AppSpacing.pad12),
        child: this,
      );

  /// 顶部内边距 - 标准 (16pt)
  Widget paddingTop16() => Padding(
        padding: const EdgeInsets.only(top: AppSpacing.pad16),
        child: this,
      );

  /// 顶部内边距 - 中大 (20pt)
  Widget paddingTop20() => Padding(
        padding: const EdgeInsets.only(top: AppSpacing.pad20),
        child: this,
      );

  /// 顶部内边距 - 大 (24pt)
  Widget paddingTop24() => Padding(
        padding: const EdgeInsets.only(top: AppSpacing.pad24),
        child: this,
      );

  /// 底部内边距 - 极小 (4pt)
  Widget paddingBottom4() => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.pad4),
        child: this,
      );

  /// 底部内边距 - 小 (8pt)
  Widget paddingBottom8() => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.pad8),
        child: this,
      );

  /// 底部内边距 - 中小 (12pt)
  Widget paddingBottom12() => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.pad12),
        child: this,
      );

  /// 底部内边距 - 标准 (16pt)
  Widget paddingBottom16() => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.pad16),
        child: this,
      );

  /// 底部内边距 - 中大 (20pt)
  Widget paddingBottom20() => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.pad20),
        child: this,
      );

  /// 底部内边距 - 大 (24pt)
  Widget paddingBottom24() => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.pad24),
        child: this,
      );

  /// 左侧内边距 - 标准 (16pt)
  Widget paddingLeft16() => Padding(
        padding: const EdgeInsets.only(left: AppSpacing.pad16),
        child: this,
      );

  /// 右侧内边距 - 标准 (16pt)
  Widget paddingRight16() => Padding(
        padding: const EdgeInsets.only(right: AppSpacing.pad16),
        child: this,
      );

  // ============== 外边距 ==============

  /// 极小外边距 (4pt) - 所有方向
  Widget marginAll4() => Padding(
        padding: const EdgeInsets.all(AppSpacing.margin4),
        child: this,
      );

  /// 标准外边距 (16pt) - 所有方向
  Widget marginAll16() => Padding(
        padding: const EdgeInsets.all(AppSpacing.margin16),
        child: this,
      );

  /// 大外边距 (24pt) - 所有方向
  Widget marginAll24() => Padding(
        padding: const EdgeInsets.all(AppSpacing.margin24),
        child: this,
      );

  /// 顶部外边距 - 极小 (4pt)
  Widget marginTop4() => Padding(
        padding: const EdgeInsets.only(top: AppSpacing.margin4),
        child: this,
      );

  /// 顶部外边距 - 小 (8pt)
  Widget marginTop8() => Padding(
        padding: const EdgeInsets.only(top: AppSpacing.s8),
        child: this,
      );

  /// 顶部外边距 - 中小 (12pt)
  Widget marginTop12() => Padding(
        padding: const EdgeInsets.only(top: AppSpacing.s12),
        child: this,
      );

  /// 顶部外边距 - 标准 (16pt)
  Widget marginTop16() => Padding(
        padding: const EdgeInsets.only(top: AppSpacing.margin16),
        child: this,
      );

  /// 顶部外边距 - 大 (24pt)
  Widget marginTop24() => Padding(
        padding: const EdgeInsets.only(top: AppSpacing.margin24),
        child: this,
      );

  /// 底部外边距 - 极小 (4pt)
  Widget marginBottom4() => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.margin4),
        child: this,
      );

  /// 底部外边距 - 小 (8pt)
  Widget marginBottom8() => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.s8),
        child: this,
      );

  /// 底部外边距 - 中小 (12pt)
  Widget marginBottom12() => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.s12),
        child: this,
      );

  /// 底部外边距 - 标准 (16pt)
  Widget marginBottom16() => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.margin16),
        child: this,
      );

  /// 底部外边距 - 大 (24pt)
  Widget marginBottom24() => Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.margin24),
        child: this,
      );

  /// 左侧外边距 - 标准 (16pt)
  Widget marginLeft16() => Padding(
        padding: const EdgeInsets.only(left: AppSpacing.margin16),
        child: this,
      );

  /// 右侧外边距 - 标准 (16pt)
  Widget marginRight16() => Padding(
        padding: const EdgeInsets.only(right: AppSpacing.margin16),
        child: this,
      );

  /// 水平外边距 - 标准 (16pt)
  Widget marginHorizontal16() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.margin16),
        child: this,
      );
}

/// SizedBox 间距扩展
///
/// 提供快速创建空白间距 Widget 的静态方法
class Spacing {
  Spacing._();

  // ============== 水平间距 ==============

  /// 极小水平间距 (4pt)
  static const Widget h4 = SizedBox(width: AppSpacing.s4);

  /// 小水平间距 (8pt)
  static const Widget h8 = SizedBox(width: AppSpacing.s8);

  /// 中小水平间距 (12pt)
  static const Widget h12 = SizedBox(width: AppSpacing.s12);

  /// 标准水平间距 (16pt)
  static const Widget h16 = SizedBox(width: AppSpacing.s16);

  /// 中大水平间距 (20pt)
  static const Widget h20 = SizedBox(width: AppSpacing.s20);

  /// 大水平间距 (24pt)
  static const Widget h24 = SizedBox(width: AppSpacing.s24);

  /// 超大水平间距 (30pt)
  static const Widget h30 = SizedBox(width: AppSpacing.s30);

  // ============== 垂直间距 ==============

  /// 极小垂直间距 (4pt)
  static const Widget v4 = SizedBox(height: AppSpacing.s4);

  /// 小垂直间距 (8pt)
  static const Widget v8 = SizedBox(height: AppSpacing.s8);

  /// 中小垂直间距 (12pt)
  static const Widget v12 = SizedBox(height: AppSpacing.s12);

  /// 标准垂直间距 (16pt)
  static const Widget v16 = SizedBox(height: AppSpacing.s16);

  /// 中大垂直间距 (20pt)
  static const Widget v20 = SizedBox(height: AppSpacing.s20);

  /// 大垂直间距 (24pt)
  static const Widget v24 = SizedBox(height: AppSpacing.s24);

  /// 超大垂直间距 (30pt)
  static const Widget v30 = SizedBox(height: AppSpacing.s30);
}

/// Sliver间距扩展
///
/// 为 Sliver 组件提供快速间距方法
class SliverSpacing {
  SliverSpacing._();

  // ============== Sliver 垂直间距 ==============

  /// 极小 Sliver 间距 (4pt)
  static const Widget v4 = SliverToBoxAdapter(
        child: SizedBox(height: AppSpacing.s4),
      );

  /// 小 Sliver 间距 (8pt)
  static const Widget v8 = SliverToBoxAdapter(
        child: SizedBox(height: AppSpacing.s8),
      );

  /// 中小 Sliver 间距 (12pt)
  static const Widget v12 = SliverToBoxAdapter(
        child: SizedBox(height: AppSpacing.s12),
      );

  /// 标准 Sliver 间距 (16pt)
  static const Widget v16 = SliverToBoxAdapter(
        child: SizedBox(height: AppSpacing.s16),
      );

  /// 中大 Sliver 间距 (20pt)
  static const Widget v20 = SliverToBoxAdapter(
        child: SizedBox(height: AppSpacing.s20),
      );

  /// 大 Sliver 间距 (24pt)
  static const Widget v24 = SliverToBoxAdapter(
        child: SizedBox(height: AppSpacing.s24),
      );

  /// 超大 Sliver 间距 (30pt)
  static const Widget v30 = SliverToBoxAdapter(
        child: SizedBox(height: AppSpacing.s30),
      );
}
