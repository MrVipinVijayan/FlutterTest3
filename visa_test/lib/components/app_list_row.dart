import 'package:flutter/material.dart';
import 'package:visa_test/constants/color_constants.dart';
import 'package:visa_test/models/contact_model.dart';

import 'app_icon_btn.dart';
import 'app_txt.dart';

class ListRow extends StatelessWidget {
  final Contact contact;
  final Function onTap;
  final Function onEditTap;
  final Function onDelete;
  ListRow({
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
              Radius.circular(3.0),
            ),
          ),
          color: Colors.white,
          child: Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Row(
                children: [
                  Icon(
                    Icons.person_outline,
                    size: 50,
                    color: Theme.of(context).primaryColor.withAlpha(100),
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
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Flexible(
                          child: AppTxt(
                            text: contact.emailAddress,
                            fontWeight: FontWeight.normal,
                            lines: 2,
                            fontSize: 16.0,
                          ),
                        ),
                        Row(
                          children: [
                            AppTxt(
                              text: contact.phoneNumber,
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                            ),
                            Spacer(),
                            AppIconBtn(
                              iconColor: appGrey,
                              iconData: Icons.edit_outlined,
                              onTap: () async {
                                onEditTap();
                              },
                            ),
                            AppIconBtn(
                              iconColor: appGrey,
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
