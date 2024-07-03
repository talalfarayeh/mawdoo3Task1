import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mawdo333/utils/constant/app_colors.dart';

class MainText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final double? height;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? letterSpacing;
  final List<Shadow>? shadow;

  const MainText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.height,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.shadow,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        fontFamily: 'Raleway',
        letterSpacing: letterSpacing ?? 0,
        color: color ?? AppColors.white,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: height,
        shadows: shadow,
        decoration: decoration,
      ),
    );
  }
}
