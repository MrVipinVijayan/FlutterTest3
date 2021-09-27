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
  final Function? onTap;
  AppProfileListTile({
    required this.title,
    required this.value,
    this.editMode = false,
    this.onNewText,
    this.titleBold,
    this.valueBold,
    this.titleFontSize,
    this.valueFontSize,
    this.onTap,
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
                Material(
                  child: InkWell(
                    splashColor: Theme.of(context).primaryColor,
                    highlightColor: Theme.of(context).primaryColor,
                    onTap: () async {
                      if (null != onTap) onTap!();
                    },
                    child: AppTxt(
                      text: value ?? '',
                      color: appBlack,
                      fontWeight: titleBold ?? FontWeight.normal,
                      fontSize: titleFontSize ?? 20.0,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
          Visibility(
            visible: editMode,
            child: Column(
              children: [
                Container(
                  child: AppTF(
                    hintText: title,
                    initialValue: value ?? '',
                    onTextChanged: (val) {
                      if (null != onNewText) onNewText!(val);
                    },
                  ),
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
