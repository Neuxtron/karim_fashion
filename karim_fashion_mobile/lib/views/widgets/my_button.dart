import 'package:karim_fashion/utils/app_constants.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final EdgeInsetsGeometry margin;
  final Color color;
  final Color textColor;
  final bool rounded;
  final TextStyle? textStyle;
  final double? minWidth;

  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.minWidth,
    this.rounded = false,
    this.textColor = Colors.white,
    this.margin = EdgeInsets.zero,
    this.color = AppConstants.secondary,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        textColor: textColor,
        shape: rounded
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              )
            : null,
        minWidth: minWidth,
        child: Text(text, style: textStyle),
      ),
    );
  }
}
