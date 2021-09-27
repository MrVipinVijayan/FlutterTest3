import 'package:flutter/material.dart';
import 'package:visa_test/constants/color_constants.dart';

class AppTxt extends StatelessWidget {
  AppTxt({
    required this.text,
    this.alignment,
    this.parentAlignment,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.lines,
    this.lineHeight,
  });
  final int? lines;
  final FontWeight? fontWeight;
  final String text;
  final TextAlign? alignment;
  final Alignment? parentAlignment;
  final double? fontSize;
  final Color? color;
  final double? lineHeight;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: parentAlignment,
        padding: EdgeInsets.all(0.0),
        color: Colors.transparent,
        child: Text(
          text,
          textAlign: alignment,
          maxLines: lines ?? 1,
          style: TextStyle(
            color: color ?? appBlack,
            fontSize: fontSize ?? 16.0,
            fontWeight: fontWeight ?? FontWeight.normal,
            height: lineHeight ?? 1.0,
          ),
        ),
      ),
    );
  }
}
