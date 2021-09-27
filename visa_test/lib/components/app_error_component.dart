import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  final String? message;
  final Function? onTap;
  AppError({this.message, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: null != message,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          onTap: () async {
            if (null != onTap) onTap!();
          },
          child: Container(
            child: Text(
              message ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
