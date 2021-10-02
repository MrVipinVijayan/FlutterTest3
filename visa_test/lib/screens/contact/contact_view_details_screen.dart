import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visa_test/components/app_icon_btn.dart';
import 'package:visa_test/components/app_txt.dart';
import 'package:visa_test/components/app_profile_tile.dart';
import 'package:visa_test/constants/color_constants.dart';
import 'package:visa_test/constants/constants.dart';
import 'package:visa_test/models/contact_model.dart';
import 'package:visa_test/utils/dialog_utils.dart';
import 'package:visa_test/utils/navigation_utils.dart';
import 'package:visa_test/utils/utils.dart';
import 'package:visa_test/view_models/contact_bloc.dart';
import 'package:visa_test/view_models/contact_state.dart';

class ViewContactDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    Contact selectedContact = arg[PARAM_CONTACTS_KEY];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: AppTxt(
          text: '${selectedContact.firstName} ${selectedContact.lastName}',
          fontSize: 20.0,
          color: appWhite,
        ),
        leading: AppIconBtn(
          iconData: Icons.arrow_back_ios_new,
          iconColor: Colors.white,
          onTap: () async {
            Navigator.pop(context);
          },
        ),
        actions: [
          AppIconBtn(
            iconData: Icons.edit_outlined,
            onTap: () async {
              Contact tempContact = Contact.copyWith(
                id: selectedContact.id,
                firstName: selectedContact.firstName,
                lastName: selectedContact.lastName,
                phoneNumber: selectedContact.phoneNumber,
                emailAddress: selectedContact.emailAddress,
              );
              openContactEditScreen(selectedContact: tempContact);
            },
          ),
        ],
      ),
      body: Hero(
        tag: 'contact_${selectedContact.id}',
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SizedBox(height: 10.0),
                    BlocBuilder<ContactBloc, ContactState>(
                      builder: (BuildContext context, ContactState state) {
                        return Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              AppProfileListTile(
                                title: "First Name",
                                value: selectedContact.firstName,
                              ),
                              SizedBox(height: 25.0),
                              AppProfileListTile(
                                title: "Last Name",
                                value: selectedContact.lastName,
                              ),
                              SizedBox(height: 25.0),
                              AppProfileListTile(
                                title: "Email",
                                value: selectedContact.emailAddress,
                              ),
                              SizedBox(height: 25.0),
                              AppProfileListTile(
                                title: "Phone Number",
                                value: selectedContact.phoneNumber,
                                onTap: () async {
                                  bool launched = await Utils.launchPhoneDialer(
                                      selectedContact.phoneNumber);
                                  if (!launched) {
                                    DialogUtils.showSnackBar(
                                      message:
                                          'Sorry, Failed to open Phone Dialer',
                                    );
                                  }
                                },
                              )
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
