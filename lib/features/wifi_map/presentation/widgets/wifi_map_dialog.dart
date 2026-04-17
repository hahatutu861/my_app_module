import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:my_app_module/core/design/app_color_extension.dart';
import 'package:my_app_module/core/design/app_media_query_extension.dart';
import 'package:my_app_module/shared/ui/widgets/app_image.dart';

import '../../../../shared/utils/build_context_extension.dart';

class WifiMapDialog extends HookConsumerWidget {
  const WifiMapDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = useMemoized(() => PageController());
    final currentPage = useState(0);
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Container(
        width: context.screenWidth * 0.85,
        decoration: BoxDecoration(
          color: context.appColors.fontWh1with100Opacity,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    context.l10n.wifiMapDialogTips,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: context.appColors.fontGy1with90Opacity
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.l10n.wifiMapDialogSelectTile,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: context.appColors.fontGy2with60Opacity
                    ),
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: PageView(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  currentPage.value = index;
                },
                children: [
                  AppImage(
                    'select_tile.png',
                    fit: BoxFit.contain,
                  ),
                  AppImage(
                    'out.png',
                    fit: BoxFit.contain,
                  ),
                  AppImage(
                    'move_grid.png',
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentPage.value == index
                        ? context.appColors.brand6Normal
                        : context.appColors.gray3,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: context.appColors.gray3,
                    width: 0.5,
                  ),
                ),
              ),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    if (currentPage.value < 2) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.of(context).pop();
                    }
                  },
                  style: ButtonStyle(
                    padding: WidgetStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      context.appColors.fontWh1with100Opacity,
                    ),
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    elevation: WidgetStateProperty.all(0),
                    shadowColor: WidgetStateProperty.all(Colors.transparent),
                  ),
                  child: Text(
                    currentPage.value == 2
                        ? 'OK'
                        : context.l10n.wifiMapDialogNext,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: context.appColors.brand6Normal
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
