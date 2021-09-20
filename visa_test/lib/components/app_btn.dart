import 'package:flutter/material.dart';
import 'app_txt.dart';
import 'app_loading.dart';

class AppBtn extends StatelessWidget {
  final String text;
  final Function onPress;
  final Color? color;
  final bool loading;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final Color? bgColor;

  AppBtn({
    required this.text,
    this.color,
    this.fontWeight,
    required this.onPress,
    this.loading = false,
    this.borderColor,
    this.bgColor,
  });

  final double height = 50;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        onPress();
      },
      child: Container(
        height: height,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 30, right: 30),
        decoration: BoxDecoration(
          color: bgColor ?? Theme.of(context).primaryColor,
          border: Border.all(
            color: borderColor ?? Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: loading,
              child: Container(
                width: 60,
                child: AppLoading(),
              ),
            ),
            Visibility(
              visible: !loading,
              child: AppTxt(
                text: text,
                fontSize: 16,
                fontWeight: fontWeight ?? FontWeight.bold,
                color: color ?? Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
