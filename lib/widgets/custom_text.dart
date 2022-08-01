import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final String? fontFamily;

  const CustomText(
    this.text, {
    Key? key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.textAlign,
    this.textOverflow,
    this.textDecoration,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
      style: fontFamily != null
          ? TextStyle(
              decoration: textDecoration,
              color: color,
              fontSize: fontSize ?? 21,
              fontWeight: fontWeight ?? FontWeight.normal,
              fontFamily: fontFamily,
            )
          : TextStyle(
              decoration: textDecoration,
              color: color,
              fontSize: fontSize ?? 21,
              fontWeight: fontWeight ?? FontWeight.normal,
            ),
    );
  }
}
