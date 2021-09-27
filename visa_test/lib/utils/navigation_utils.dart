import 'package:flutter/material.dart';
import 'package:visa_test/constants/constants.dart';
import 'package:visa_test/models/contact_model.dart';
import 'package:visa_test/routes/routes.dart';

openHome() async {
  Navigator.of(globalKey.currentContext!).pushReplacementNamed(Routes.HOME);
}

openContactDetailsScreen({required Contact selectedContact}) async {
  Navigator.of(globalKey.currentContext!).pushNamed(
    Routes.VIEW,
    arguments: {PARAM_CONTACTS_KEY: selectedContact},
  );
}

openContactEditScreen({required Contact selectedContact}) async {
  Navigator.of(globalKey.currentContext!).pushNamed(
    Routes.EDIT,
    arguments: {PARAM_CONTACTS_KEY: selectedContact},
  );
}

openContactAddScreen() async {
  Navigator.of(globalKey.currentContext!).pushNamed(Routes.ADD);
}
