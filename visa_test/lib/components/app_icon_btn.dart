import 'package:flutter/material.dart';

class AppIconBtn extends StatelessWidget {
  final Function onTap;
  final IconData iconData;
  final Color? iconColor;
  AppIconBtn({
    required this.iconData,
    required this.onTap,
    this.iconColor,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        child: IconButton(
          color: iconColor ?? Theme.of(context).iconTheme.color,
          onPressed: () async {
            onTap();
          },
          icon: Icon(iconData),
        ),
      ),
    );
  }
}
