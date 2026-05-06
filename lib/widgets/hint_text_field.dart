import 'package:flutter/material.dart';
import 'package:my_app_module/utils/design/app_color_extension.dart';

class HintTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  const HintTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.onChanged,
    this.textInputAction,
    this.focusNode,
    this.hintStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      focusNode: focusNode,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyle(
              color: context.appColors.fontGy2with60Opacity,
              fontSize: 14,
            ),
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.zero,
      ),
      style: textStyle ??
          TextStyle(
            fontSize: 14,
            color: context.appColors.fontGy1with90Opacity,
          ),
    );
  }
}
