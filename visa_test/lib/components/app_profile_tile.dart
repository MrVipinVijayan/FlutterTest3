import 'package:flutter/material.dart';
import 'package:visa_test/components/app_tf.dart';
import 'package:visa_test/constants/color_constants.dart';

import 'app_txt.dart';

class AppProfileListTile extends StatelessWidget {
  final String title;
  final String? value;
  final bool editMode;
  final Function? onNewText;
  final FontWeight? titleBold;
  final FontWeight? valueBold;
  final double? titleFontSize;
  final double? valueFontSize;
  AppProfileListTile({
    required this.title,
    required this.value,
    this.editMode = false,
    this.onNewText,
    this.titleBold,
    this.valueBold,
    this.titleFontSize,
    this.valueFontSize,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: !editMode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTxt(
                  text: title,
                  color: appGrey,
                  fontWeight: titleBold ?? FontWeight.normal,
                  fontSize: titleFontSize ?? 16.0,
                ),
                SizedBox(height: 10.0),
                AppTxt(
                  text: value ?? '',
                  color: appBlack,
                  fontWeight: titleBold ?? FontWeight.normal,
                  fontSize: titleFontSize ?? 20.0,
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
          Visibility(
            visible: editMode,
            child: Column(
              children: [
                AppTF(
                  hintText: title,
                  initialValue: value ?? '',
                  onTextChanged: (val) {
                    if (null != onNewText) onNewText!(val);
                  },
                ),
                SizedBox(height: 15.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
