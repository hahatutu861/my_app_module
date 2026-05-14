import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';

class AppBubbleTip extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? bubbleColor;
  final double arrowWidth;
  final double arrowHeight;
  final double borderRadius;
  final double? arrowXOffset;
  final Size? targetWidgetSize;

  const AppBubbleTip({
    super.key,
    required this.text,
    this.textStyle,
    this.bubbleColor,
    this.arrowWidth = 10,
    this.arrowHeight = 6,
    this.borderRadius = 8,
    this.arrowXOffset,
    this.targetWidgetSize,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BubblePainter(
        color: bubbleColor ?? context.appColors.fontGy1with90Opacity,
        arrowWidth: arrowWidth,
        arrowHeight: arrowHeight,
        borderRadius: borderRadius,
        arrowXOffset: arrowXOffset,
        targetWidgetSize: targetWidgetSize,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: arrowHeight + 8.h,
          left: 12.w,
          right: 12.w,
          bottom: 8.h,
        ),
        child: Text(
          text,
          style: textStyle ??
              TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: context.appColors.fontWh1with100Opacity,
              ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _BubblePainter extends CustomPainter {
  final Color color;
  final double arrowWidth;
  final double arrowHeight;
  final double borderRadius;
  final double? arrowXOffset;
  final Size? targetWidgetSize;

  _BubblePainter({
    required this.color,
    required this.arrowWidth,
    required this.arrowHeight,
    required this.borderRadius,
    this.arrowXOffset,
    this.targetWidgetSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final rect = Rect.fromLTWH(
      0,
      arrowHeight,
      size.width,
      size.height - arrowHeight,
    );
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));
    canvas.drawRRect(rrect, paint);

    double centerX;
    if (targetWidgetSize != null) {
      centerX = size.width - targetWidgetSize!.width / 2;
    } else {
      centerX = arrowXOffset ?? (size.width / 2);
    }

    final arrowPath = Path()
      ..moveTo(centerX, 0)
      ..lineTo(centerX - arrowWidth / 2, arrowHeight)
      ..lineTo(centerX + arrowWidth / 2, arrowHeight)
      ..close();

    canvas.drawPath(arrowPath, paint);
  }

  @override
  bool shouldRepaint(covariant _BubblePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.arrowWidth != arrowWidth ||
        oldDelegate.arrowHeight != arrowHeight ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.arrowXOffset != arrowXOffset ||
        oldDelegate.targetWidgetSize != targetWidgetSize;
  }
}

class AppAnimatedBubbleTip extends HookWidget {
  final String text;
  final Duration autoHideDuration;
  final double? arrowXOffset;
  final Size? targetWidgetSize;

  const AppAnimatedBubbleTip({
    super.key,
    required this.text,
    this.autoHideDuration = const Duration(seconds: 2),
    this.arrowXOffset,
    this.targetWidgetSize,
  });

  @override
  Widget build(BuildContext context) {
    final fadeController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );

    final fadeAnimation = useMemoized(
      () => Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: fadeController, curve: Curves.easeInOut),
      ),
      [fadeController],
    );

    useEffect(() {
      final timer = Timer(autoHideDuration, () {
        if (fadeController.status == AnimationStatus.dismissed) {
          fadeController.forward();
        }
      });
      return () => timer.cancel();
    }, [autoHideDuration]);

    return FadeTransition(
      opacity: fadeAnimation,
      child: AppBubbleTip(
        text: text,
        arrowXOffset: arrowXOffset,
        targetWidgetSize: targetWidgetSize,
      ),
    );
  }
}
