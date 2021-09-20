import 'package:flutter/material.dart';
import 'package:visa_test/constants/color_constants.dart';

import 'app_btn.dart';
import 'app_txt.dart';

class AppBottomSheetDialogLayout extends StatelessWidget {
  final String message;
  final bool success;
  final String okayTxt;
  final String cancelTxt;
  final Function okCallback;
  final Function onCancelCallback;

  AppBottomSheetDialogLayout({
    required this.message,
    required this.okCallback,
    required this.onCancelCallback,
    this.success = false,
    this.okayTxt = 'OKAY',
    this.cancelTxt = 'CANCEL',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30.0, 10, 30, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: success,
            child: Icon(
              success ? Icons.check : Icons.close,
              color: success ? Colors.green : Colors.red,
              size: 50,
            ),
          ),
          SizedBox(height: 20),
          AppTxt(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            lines: 5,
            lineHeight: 1.5,
            text: message,
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppBtn(
                text: okayTxt,
                bgColor: Theme.of(context).primaryColor,
                color: Colors.white,
                onPress: () async {
                  okCallback();
                },
              ),
              SizedBox(width: 10.0),
              AppBtn(
                text: cancelTxt,
                color: Colors.white,
                borderColor: appGrey,
                bgColor: appGrey,
                onPress: () async {
                  onCancelCallback();
                },
              )
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
