import 'package:flutter/material.dart';
import '../utils/design/app_color_extension.dart';

/// 简化版图片 Widget - 自动处理错误，自动加上 assets/images/ 前缀
///
/// 支持暗黑模式按需切换：
/// 1. 如果是暗黑模式，优先尝试加载 assets/images/dark/ 目录下的同名文件
/// 2. 如果在 dark 目录找不到，或者当前不是暗黑模式，则回退到 assets/images/ 根目录加载
class AppImage extends StatelessWidget {
  final String fileName;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Color? color;

  const AppImage(
    this.fileName, {
    super.key,
    this.width,
    this.height,
    this.fit,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.appColors.isDark;

    if (isDark) {
      return Image.asset(
        'assets/images/dark/$fileName',
        width: width,
        height: height,
        fit: fit,
        color: color,
        errorBuilder: (context, error, stackTrace) => _buildDefaultImage(context),
      );
    }
    return _buildDefaultImage(context);
  }

  /// 构建默认图片（assets/images/ 根目录）
  Widget _buildDefaultImage(BuildContext context) {
    return Image.asset(
      'assets/images/$fileName',
      width: width,
      height: height,
      fit: fit,
      color: color,
      errorBuilder: (context, error, stackTrace) {
        return Icon(
          Icons.image_not_supported_outlined,
          size: width ?? height ?? 24,
          color: Colors.grey,
        );
      },
    );
  }
}
