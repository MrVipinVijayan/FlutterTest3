import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visa_test/components/app_icon_btn.dart';
import 'package:visa_test/components/app_error_component.dart';
import 'package:visa_test/components/app_global_widget.dart';
import 'package:visa_test/components/app_txt.dart';
import 'package:visa_test/components/app_profile_tile.dart';
import 'package:visa_test/constants/color_constants.dart';
import 'package:visa_test/utils/dialog_utils.dart';
import 'package:visa_test/view_models/contact_bloc.dart';
import 'package:visa_test/view_models/contact_events.dart';
import 'package:visa_test/view_models/contact_state.dart';

class AddContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: AppTxt(
          text: 'Add Contact',
          color: Colors.white,
        ),
        leading: AppIconBtn(
          iconData: Icons.arrow_back_ios_new,
          iconColor: appWhite,
          onTap: () async {
            BlocProvider.of<ContactBloc>(context).add(FetchContactsEvent());
            DialogUtils.hideKeyboard();
            DialogUtils.hideSnackBar();
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
              BlocProvider.of<ContactBloc>(context).add(AddContactEvent());
            },
          ),
          SizedBox(width: 10.0),
        ],
      ),
      body: AppGlobalWidget(
        child: Column(
          children: [
            BlocListener(
              bloc: BlocProvider.of<ContactBloc>(context),
              listener: (context, state) {
                if (state is AddContactSuccessState) {
                  Navigator.pop(context);
                }
              },
              child: BlocBuilder<ContactBloc, ContactState>(
                builder: (BuildContext context, ContactState state) {
                  if (state is AddContactInvalidState) {
                    return AppError(message: state.message);
                  }
                  return Container();
                },
              ),
            ),
            Hero(
              tag: 'add_contact',
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(height: 20.0),
                  AppProfileListTile(
                    title: "First Name",
                    value: null,
                    editMode: true,
                    onNewText: (val) async {
                      BlocProvider.of<ContactBloc>(context)
                          .newContact
                          .firstName = val;
                    },
                  ),
                  AppProfileListTile(
                    title: "Last Name",
                    value: null,
                    editMode: true,
                    onNewText: (val) async {
                      BlocProvider.of<ContactBloc>(context)
                          .newContact
                          .lastName = val;
                    },
                  ),
                  AppProfileListTile(
                    title: "Email",
                    value: null,
                    editMode: true,
                    onNewText: (val) async {
                      BlocProvider.of<ContactBloc>(context)
                          .newContact
                          .emailAddress = val;
                    },
                  ),
                  AppProfileListTile(
                    title: "Phone Number",
                    value: null,
                    editMode: true,
                    onNewText: (val) async {
                      BlocProvider.of<ContactBloc>(context)
                          .newContact
                          .phoneNumber = val;
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
