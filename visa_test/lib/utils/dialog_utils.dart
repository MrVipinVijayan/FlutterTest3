import 'package:flutter/material.dart';
import 'package:visa_test/components/app_bottom_sheet_layout.dart';
import 'package:visa_test/components/app_txt.dart';
import 'package:visa_test/constants/constants.dart';

class DialogUtils {
  static showTwoBtnBottomSheet(
    context, {
    required String message,
    bool success = false,
    String okayTxt = 'OKAY',
    String cancelTxt = 'CANCEL',
    required Function okCallback,
    required Function onCancelCallback,
  }) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return AppBottomSheetDialogLayout(
          message: message,
          okCallback: okCallback,
          onCancelCallback: onCancelCallback,
        );
      },
    );
  }

  static void showSnackBar({
    required String message,
    int delay = SNACKBAR_DELAY,
    String actionText = 'OKAY',
    bool success = true,
    final Function? onOkayCalback,
  }) async {
    hideSnackBar();
    final snackBar = SnackBar(
      backgroundColor: success
          ? Theme.of(globalKey.currentContext!).primaryColor
          : Colors.red[600],
      elevation: 0.0,
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      content: Container(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: AppTxt(
                    text: message,
                    alignment: TextAlign.center,
                    color: Colors.white,
                    lineHeight: 1.5,
                    lines: 6,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Visibility(
              visible: null != onOkayCalback,
              child: Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: () async {
                      hideSnackBar();
                      if (null != onOkayCalback) onOkayCalback();
                    },
                    child: AppTxt(
                      text: actionText,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 20.0),
                ],
              ),
            ),
          ],
        ),
      ),
      duration: Duration(seconds: delay),
    );
    ScaffoldMessenger.of(globalKey.currentContext!).showSnackBar(snackBar);
  }

  static hideSnackBar() async {
    ScaffoldMessenger.of(globalKey.currentContext!).hideCurrentSnackBar();
  }

  static void hideKeyboard() async {
    FocusScope.of(globalKey.currentContext!).requestFocus(FocusNode());
  }
}
