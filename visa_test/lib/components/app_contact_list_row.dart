import 'package:flutter/material.dart';
import 'package:visa_test/constants/constants.dart';
import 'package:visa_test/models/contact_model.dart';

import 'app_icon_btn.dart';
import 'app_txt.dart';

class AppContactListRow extends StatelessWidget {
  final Contact contact;
  final Function onTap;
  final Function onEditTap;
  final Function onDelete;
  AppContactListRow({
    required this.contact,
    required this.onTap,
    required this.onEditTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        onTap();
      },
      child: Hero(
        tag: 'contact_${contact.id}',
        child: Card(
          elevation: 1.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
              child: Row(
                children: [
                  Image.asset(
                    CONTACT_DEFAULT_ICON,
                    width: 80,
                    height: 80,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: AppTxt(
                            text: '${contact.firstName} ${contact.lastName}',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Flexible(
                          child: AppTxt(
                            text: contact.emailAddress,
                            fontWeight: FontWeight.normal,
                            lines: 2,
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 16.0,
                          ),
                        ),
                        Row(
                          children: [
                            AppTxt(
                              text: contact.phoneNumber,
                              fontWeight: FontWeight.normal,
                              fontSize: 18.0,
                            ),
                            Spacer(),
                            AppIconBtn(
                              iconData: Icons.edit_outlined,
                              onTap: () async {
                                onEditTap();
                              },
                            ),
                            AppIconBtn(
                              iconData: Icons.delete,
                              onTap: () async {
                                onDelete();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
