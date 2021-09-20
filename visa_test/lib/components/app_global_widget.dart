import 'package:flutter/material.dart';
import 'package:visa_test/utils/dialog_utils.dart';

class AppGlobalWidget extends StatelessWidget {
  @required
  final Widget child;
  AppGlobalWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        DialogUtils.hideKeyboard();
        DialogUtils.hideSnackBar();
      },
      child: SafeArea(child: child),
    );
  }
}
