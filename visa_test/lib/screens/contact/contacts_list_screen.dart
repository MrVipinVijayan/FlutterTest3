import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visa_test/components/app_error_component.dart';
import 'package:visa_test/components/app_txt.dart';
import 'package:visa_test/components/app_contact_list_row.dart';
import 'package:visa_test/components/app_loading.dart';
import 'package:visa_test/models/contact_model.dart';
import 'package:visa_test/utils/dialog_utils.dart';
import 'package:visa_test/utils/screen_utils.dart';
import 'package:visa_test/view_models/contact_bloc.dart';
import 'package:visa_test/view_models/contact_events.dart';
import 'package:visa_test/view_models/contact_state.dart';

class ContactsHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        title: AppTxt(
          text: 'Contacts',
          fontSize: 20.0,
          color: Colors.white,
        ),
        actions: [
          BlocBuilder(
            bloc: BlocProvider.of<ContactBloc>(context),
            builder: (context, state) {
              int count = BlocProvider.of<ContactBloc>(context).contacts.length;
              return Visibility(
                visible: count > 0,
                child: Center(
                  child: AppTxt(
                    color: Theme.of(context).secondaryHeaderColor,
                    text: '$count',
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: _body(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: 'add_contact',
        // backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add_outlined,
          color: Colors.white,
        ),
        onPressed: () async {
          BlocProvider.of<ContactBloc>(context).add(ClearAddContactEvent());
          openContactAddScreen();
        },
      ),
    );
  }

  _body(BuildContext context) {
    return ListView(
      children: [
        BlocListener(
          bloc: BlocProvider.of<ContactBloc>(context),
          listener: (context, state) {
            if (state is DeleteSuccessState) {
              DialogUtils.showSnackBar(message: 'Contact Deleted');
              return;
            }
            if (state is AddContactSuccessState) {
              DialogUtils.showSnackBar(message: 'Contact Added');
              return;
            }
            if (state is UpdateSuccessState) {
              DialogUtils.showSnackBar(message: 'Contact Updated');
            }
          },
          child: BlocBuilder<ContactBloc, ContactState>(
            builder: (BuildContext context, ContactState state) {
              if (state is ContactErrorState) {
                final error = state.error;
                String message = '${error.message}\nTap to Retry.';
                return AppError(
                  message: message,
                  onTap: () async {},
                );
              }
              if (state is ContactLoadedState) {
                if (state.contacts.isEmpty) {
                  return Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(50.0),
                    child: AppTxt(
                      text: 'No Contacts',
                      color: Theme.of(context).backgroundColor,
                      onTap: () async {},
                    ),
                  );
                }
                return _list(context, state.contacts);
              }
              return AppLoading();
            },
          ),
        ),
        Container(height: 100),
      ],
    );
  }

  Widget _list(BuildContext context, List<Contact> contacts) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      cacheExtent: 100,
      itemCount: contacts.length,
      itemBuilder: (_, index) {
        Contact contact = contacts[index];
        return AppContactListRow(
          contact: contact,
          onTap: () async {
            _onContactSelected(context, contact);
          },
          onEditTap: () async {
            _onContactEditTap(context, contact);
          },
          onDelete: () async {
            _onDeleteTap(context, contact);
          },
        );
      },
    );
  }

  _onContactSelected(BuildContext context, Contact contact) async {
    openContactDetailsScreen(selectedContact: contact);
  }

  _onDeleteTap(BuildContext context, Contact contact) async {
    DialogUtils.showTwoBtnBottomSheet(context,
        message:
            "Are you sure you want to delete contact '${contact.firstName} ${contact.lastName}'",
        okCallback: () async {
      Navigator.pop(context);
      BlocProvider.of<ContactBloc>(context).add(DeleteContactEvent(contact));
    }, onCancelCallback: () async {
      Navigator.pop(context);
    });
  }

  _onContactEditTap(BuildContext context, Contact contact) async {
    Contact selectedContact = Contact.copyWith(
      id: contact.id,
      firstName: contact.firstName,
      lastName: contact.lastName,
      phoneNumber: contact.phoneNumber,
      emailAddress: contact.emailAddress,
    );
    openContactEditScreen(selectedContact: selectedContact);
  }
}
