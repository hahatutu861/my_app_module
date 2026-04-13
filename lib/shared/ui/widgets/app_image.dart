import 'package:flutter/material.dart';

/// 简化版图片 Widget - 自动处理错误，自动加上 assets/images/ 前缀
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

  /// 获取完整路径
  String get assetPath => 'assets/images/$fileName';

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
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
