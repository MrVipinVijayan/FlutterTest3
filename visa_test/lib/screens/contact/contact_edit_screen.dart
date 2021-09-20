import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visa_test/components/app_icon_btn.dart';
import 'package:visa_test/components/app_error_component.dart';
import 'package:visa_test/components/app_global_widget.dart';
import 'package:visa_test/components/app_txt.dart';
import 'package:visa_test/components/app_profile_tile.dart';
import 'package:visa_test/constants/color_constants.dart';
import 'package:visa_test/constants/constants.dart';
import 'package:visa_test/models/contact_model.dart';
import 'package:visa_test/utils/dialog_utils.dart';
import 'package:visa_test/view_models/contact_bloc.dart';
import 'package:visa_test/view_models/contact_events.dart';
import 'package:visa_test/view_models/contact_state.dart';

class EditContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;
    Contact selectedContact = arg[PARAM_CONTACTS_KEY];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: AppTxt(
          text: '${selectedContact.firstName} ${selectedContact.lastName}',
          color: Colors.white,
        ),
        leading: AppIconBtn(
          iconData: Icons.arrow_back_ios_new,
          iconColor: appWhite,
          onTap: () async {
            DialogUtils.hideKeyboard();
            DialogUtils.hideSnackBar();
            BlocProvider.of<ContactBloc>(context).add(FetchContactsEvent());
            Navigator.pop(context);
          },
        ),
        actions: [
          AppIconBtn(
            iconData: Icons.check_outlined,
            iconColor: appWhite,
            onTap: () async {
              DialogUtils.hideKeyboard();
              DialogUtils.hideSnackBar();
              BlocProvider.of<ContactBloc>(context)
                  .add(EditContactEvent(selectedContact));
            },
          ),
          SizedBox(width: 10.0),
        ],
      ),
      body: AppGlobalWidget(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 20.0),
            BlocBuilder(
              bloc: BlocProvider.of<ContactBloc>(context),
              builder: (context, state) {
                if (state is AddContactInvalidState) {
                  return AppError(message: state.message);
                }
                return Container();
              },
            ),
            BlocListener(
              bloc: BlocProvider.of<ContactBloc>(context),
              listener: (context, state) {
                if (state is UpdateSuccessState) {
                  DialogUtils.showSnackBar(message: 'Contact Updated');
                  Navigator.pop(context);
                }
              },
              child: BlocBuilder<ContactBloc, ContactState>(
                bloc: BlocProvider.of<ContactBloc>(context),
                builder: (BuildContext context, ContactState state) {
                  return Hero(
                    tag: 'contact_${selectedContact.id}',
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        AppProfileListTile(
                          title: "First Name",
                          value: selectedContact.firstName,
                          editMode: true,
                          onNewText: (val) async {
                            selectedContact.firstName = val;
                          },
                        ),
                        AppProfileListTile(
                          title: "Last Name",
                          value: selectedContact.lastName,
                          editMode: true,
                          onNewText: (val) async {
                            selectedContact.lastName = val;
                          },
                        ),
                        AppProfileListTile(
                          title: "Email",
                          value: selectedContact.emailAddress,
                          editMode: true,
                          onNewText: (val) async {
                            selectedContact.emailAddress = val;
                          },
                        ),
                        AppProfileListTile(
                          title: "Phone Number",
                          value: selectedContact.phoneNumber,
                          editMode: true,
                          onNewText: (val) async {
                            selectedContact.phoneNumber = val;
                          },
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
