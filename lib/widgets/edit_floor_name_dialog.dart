import 'package:flutter/material.dart';

import 'package:my_app_module/utils/design/app_color_extension.dart';
import 'package:my_app_module/utils/design/app_media_query_extension.dart';
import 'package:my_app_module/utils/build_context_extension.dart';

class EditFloorNameDialog extends StatefulWidget {
  final String? initialFloorName;

  const EditFloorNameDialog({
    super.key,
    this.initialFloorName,
  });

  @override
  State<EditFloorNameDialog> createState() => _EditFloorNameDialogState();
}

class _EditFloorNameDialogState extends State<EditFloorNameDialog> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialFloorName ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      child: Container(
        width: context.dialogWidth,
        decoration: BoxDecoration(
          color: context.appColors.fontWh1with100Opacity,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
              child: Text(
                context.l10n.editFloorName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: context.appColors.fontGy1with90Opacity,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Container(
                decoration: BoxDecoration(
                  color: context.appColors.gray1,
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: TextField(
                  controller: _controller,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: context.appColors.fontGy1with90Opacity,
                  ),
                  decoration: InputDecoration(
                    hintText: context.l10n.floorNameHint,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: context.appColors.fontGy2with60Opacity,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: context.appColors.gray3,
                    width: 0.5,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
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
                        context.l10n.cancel,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: context.appColors.fontGy1with90Opacity,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.5,
                    height: 51,
                    color: context.appColors.gray3,
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(_controller.text.trim());
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
                        context.l10n.save,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: context.appColors.brand6Normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
