import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:measure_size/measure_size.dart';

import '../../../../core/design/app_color_extension.dart';
import '../../../../core/design/app_spacing.dart';
import '../../../../core/design/app_text_styles.dart';
import '../../../../shared/ui/widgets/app_image.dart';
import '../../../../shared/utils/build_context_extension.dart';
import '../providers/network_topology_state.dart';
import '../providers/network_topology_viewmodel_provider.dart';

class _Dimensions {
  static const double deviceSize = 78;
  static const double deviceInnerSize = 72;
  static const double imageSize = 56;
  static const double imageHeight = 69;
  static const double indicatorSize = 36;
  static const double indicatorInnerSize = 24;
  static const double internetWidth = 72;
  static const double internetHeight = 54;
  static const double lineWidth = 4;
  static const double indicatorOffset = -10;
  static const double indicatorBorderWidth = 4;
  static const double fontSize = 14;
  static const double bubbleSpacing = 2;
}

class NetworkTopology extends HookConsumerWidget {
  const NetworkTopology({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(networkTopologyViewModelProvider);
    final viewModel = ref.read(networkTopologyViewModelProvider.notifier);
    final lineController = useAnimationController();
    final wifiSuccessController = useAnimationController();
    final secondLineController = useAnimationController();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const _InternetHeader(),
        _LineAnimation(
          controller: lineController,
          onCompleted: viewModel.onLineAnimationCompleted,
        ),
        _DeviceIndicator(
          state: state,
          controller: wifiSuccessController,
          onCompleted: viewModel.onWifiSuccessAnimationCompleted,
        ),
        const SizedBox(height: 4),
        const _DeviceInfo(),
        _SecondLineAnimation(state: state, controller: secondLineController),
        const _AccountSection(),
        const _EditTitleBar(),
      ],
    );
  }
}

class _InternetHeader extends ConsumerWidget {
  const _InternetHeader();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const AppImage(
          'internet.png',
          width: _Dimensions.internetWidth,
          height: _Dimensions.internetHeight,
        ),
        Text(
          context.l10n.internet,
          style: TextStyle(
            fontSize: _Dimensions.fontSize,
            fontWeight: FontWeight.w400,
            color: context.appColors.fontGy1with90Opacity,
          ),
        ),
      ],
    );
  }
}

class _LineAnimation extends StatelessWidget {
  const _LineAnimation({required this.controller, required this.onCompleted});

  final AnimationController controller;
  final VoidCallback onCompleted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Lottie.asset(
        'assets/images/add_line1.json',
        width: _Dimensions.lineWidth,
        fit: BoxFit.fill,
        controller: controller,
        onLoaded: (composition) {
          controller
            ..duration = composition.duration
            ..forward().then((_) {
              controller.value = 1.0;
              onCompleted();
            });
        },
        repeat: false,
      ),
    );
  }
}

class _DeviceIndicator extends ConsumerWidget {
  const _DeviceIndicator({
    required this.state,
    required this.controller,
    required this.onCompleted,
  });

  final NetworkTopologyState state;
  final AnimationController controller;
  final VoidCallback onCompleted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: _Dimensions.deviceSize,
      height: _Dimensions.deviceSize,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _DeviceCircle(context: context),
          ..._buildStateIndicator(context),
        ],
      ),
    );
  }

  List<Widget> _buildStateIndicator(BuildContext context) {
    return state.maybeWhen(
      showingWifiSuccessAnimation: () => [
        _WifiSuccessAnimation(controller: controller, onCompleted: onCompleted),
      ],
      showingSecondLineAnimation: () => const [_CompletedIndicator()],
      orElse: () => [],
    );
  }
}

class _DeviceCircle extends StatelessWidget {
  const _DeviceCircle({required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Container(
      width: _Dimensions.deviceSize,
      height: _Dimensions.deviceSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [appColors.lightBlue5, appColors.brand6Normal],
        ),
      ),
      child: Center(
        child: Container(
          width: _Dimensions.deviceInnerSize,
          height: _Dimensions.deviceInnerSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [appColors.brand2Focus, appColors.deviceCardGradientEnd],
            ),
          ),
          child: const AppImage(
            'aria3411_left.png',
            width: _Dimensions.imageSize,
            height: _Dimensions.imageHeight,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class _WifiSuccessAnimation extends StatelessWidget {
  const _WifiSuccessAnimation({
    required this.controller,
    required this.onCompleted,
  });

  final AnimationController controller;
  final VoidCallback onCompleted;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _Dimensions.indicatorOffset,
      right: _Dimensions.indicatorOffset,
      child: SizedBox(
        width: _Dimensions.indicatorSize,
        height: _Dimensions.indicatorSize,
        child: Lottie.asset(
          'assets/images/add_wifi_success.json',
          controller: controller,
          onLoaded: (composition) {
            controller
              ..duration = composition.duration
              ..forward().then((_) {
                controller.value = 1.0;
                onCompleted();
              });
          },
          repeat: false,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _CompletedIndicator extends StatelessWidget {
  const _CompletedIndicator();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: _Dimensions.indicatorOffset,
      right: _Dimensions.indicatorOffset,
      child: SizedBox(
        width: _Dimensions.indicatorSize,
        height: _Dimensions.indicatorSize,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.appColors.lightBlue6,
            border: Border.all(
              color: Colors.white,
              width: _Dimensions.indicatorBorderWidth,
            ),
          ),
          child: const Center(
            child: SizedBox(
              width: _Dimensions.indicatorInnerSize,
              height: _Dimensions.indicatorInnerSize,
              child: AppImage('wifi.png'),
            ),
          ),
        ),
      ),
    );
  }
}

class _DeviceInfo extends StatelessWidget {
  const _DeviceInfo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'AE:20:2E:12:C1:00',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: context.appColors.fontGy1with90Opacity,
          ),
        ),
        const SizedBox(width: 4),
        _EditButton(),
      ],
    );
  }
}

class _EditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          width: AppSpacing.icon24,
          height: AppSpacing.icon24,
          decoration: BoxDecoration(
            color: context.appColors.gray3,
            shape: BoxShape.circle,
          ),
          child: const Center(child: AppImage('edit.png', width: 14, height: 14)),
        ),
    );
}
}

class _SecondLineAnimation extends StatelessWidget {
  const _SecondLineAnimation({required this.state, required this.controller});

  final NetworkTopologyState state;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    final shouldShow = state.maybeWhen(
      showingSecondLineAnimation: () => true,
      orElse: () => false,
    );
    if (!shouldShow) {
      return const Expanded(child: SizedBox());
    }

    return Expanded(
      child: Lottie.asset(
        'assets/images/add_line1.json',
        width: _Dimensions.lineWidth,
        fit: BoxFit.fill,
        controller: controller,
        onLoaded: (composition) {
          controller
            ..duration = composition.duration
            ..forward().then((_) {
              controller.value = 1.0;
            });
        },
        repeat: false,
      ),
    );
  }
}

class _AccountSection extends StatelessWidget {
  const _AccountSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _Dimensions.deviceSize,
      height: _Dimensions.deviceSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: context.appColors.indigo1,
      ),
      child: const Center(
        child: AppImage(
          'network_home.png',
          width: 64,
          height: 64,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

// ====================== 以下全部是已修改的完整代码 ======================
class _EditTitleBar extends StatefulWidget {
  const _EditTitleBar();

  @override
  State<_EditTitleBar> createState() => _EditTitleBarState();
}

class _EditTitleBarState extends State<_EditTitleBar> {
  Size? _textSize;
  Size? _editButtonSize;
  Size? _editTitleButtonSize;

  bool get _isMeasured =>
      _textSize != null &&
          _editButtonSize != null &&
          _editTitleButtonSize != null;

  @override
  Widget build(BuildContext context) {
    const textContent = 'Home-xxx';
    const spacing = 4.0;
    const safeMargin = 1.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final parentWidth = constraints.maxWidth;
        if (!_isMeasured) {
          return _MeasureLayout(
            onTextSize: (size) => setState(() => _textSize = size),
            onEditButtonSize: (size) => setState(() => _editButtonSize = size),
            onEditTitleButtonSize: (size) => setState(() => _editTitleButtonSize = size),
            textContent: textContent,
            spacing: spacing,
          );
        }
        final leftSectionWidth = _textSize!.width + spacing + _editButtonSize!.width;
        final leftPosition = (parentWidth - leftSectionWidth) / 2;
        final editButtonLeft = leftPosition + _textSize!.width + spacing;
        final bubbleLeft = editButtonLeft + _editButtonSize!.width - _editTitleButtonSize!.width;

        return SizedBox(
          height: 40,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: leftPosition,
                top: 0,
                child: Row(
                  children: [
                    Text(
                      textContent,
                      style: context.appTextStyles.bodyLargeWith90Opacity,
                    ),
                    SizedBox(width: spacing),
                    _EditButton(),
                  ],
                ),
              ),
              Positioned(
                left: bubbleLeft,
                top: 26,
                child: _EditTitleButton(editButtonSize: _editButtonSize!),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MeasureLayout extends StatelessWidget {
  final ValueChanged<Size> onTextSize;
  final ValueChanged<Size> onEditButtonSize;
  final ValueChanged<Size> onEditTitleButtonSize;
  final String textContent;
  final double spacing;

  const _MeasureLayout({
    required this.onTextSize,
    required this.onEditButtonSize,
    required this.onEditTitleButtonSize,
    required this.textContent,
    required this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0,
      child: ExcludeSemantics(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MeasureSize(
              onChange: (size) => onTextSize(size),
              child: Text(
                textContent,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: context.appColors.fontGy1with90Opacity,
                ),
              ),
            ),
            SizedBox(width: spacing),
            MeasureSize(
              onChange: (size) => onEditButtonSize(size),
              child: _EditButton(),
            ),
            MeasureSize(
              onChange: (size) => onEditTitleButtonSize(size),
              child: _EditTitleButton(editButtonSize: Size(24,24)),
            ),
          ],
        ),
      ),
    );
  }
}

class _EditTitleButton extends StatelessWidget {
  final Size editButtonSize;

  const _EditTitleButton({required this.editButtonSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: _EditBubble(
        editButtonSize: editButtonSize,
        text: context.l10n.clickToEdit,
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: context.appColors.fontWh1with100Opacity,
          height: 1,
        ),
        bubbleColor: context.appColors.fontGy1with90Opacity,
        arrowWidth: 6,
        arrowHeight: 6,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}

class _EditBubble extends StatelessWidget {
  final Size editButtonSize;
  final String text;
  final TextStyle? textStyle;
  final Color bubbleColor;
  final double arrowWidth;
  final double arrowHeight;
  final BorderRadius borderRadius;

  const _EditBubble({
    required this.editButtonSize,
    required this.text,
    this.textStyle,
    this.bubbleColor = Colors.black,
    this.arrowWidth = 6,
    this.arrowHeight = 6,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BubblePainter(
        color: bubbleColor,
        arrowWidth: arrowWidth,
        arrowHeight: arrowHeight,
        borderRadius: borderRadius,
        editButtonSize: editButtonSize,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: arrowHeight + 4, left: 10, right: 10, bottom: 4),
        child: Text(
          text,
          style: textStyle,
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
  final BorderRadius borderRadius;
  final Size editButtonSize;

  _BubblePainter({
    required this.color,
    required this.arrowWidth,
    required this.arrowHeight,
    required this.borderRadius,
    required this.editButtonSize,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;

    final rect = Rect.fromLTWH(0, arrowHeight, size.width, size.height - arrowHeight);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(5));
    canvas.drawRRect(rrect, paint);

    // 箭头自动对准编辑按钮正中心
    final arrowX = size.width - editButtonSize.width / 2;

    final arrowPath = Path()
      ..moveTo(arrowX, 0)
      ..lineTo(arrowX - arrowWidth / 2, arrowHeight)
      ..lineTo(arrowX + arrowWidth / 2, arrowHeight)
      ..close();

    canvas.drawPath(arrowPath, paint);
  }

  @override
  bool shouldRepaint(covariant _BubblePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.arrowWidth != arrowWidth ||
        oldDelegate.arrowHeight != arrowHeight ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.editButtonSize != editButtonSize;
  }
}