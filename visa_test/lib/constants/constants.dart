import 'package:flutter/material.dart';

const String APP_NAME = 'Visa Contacts';
const String APP_FONT = 'Bronova';

const int SNACKBAR_DELAY = 3; // seconds
const double APP_ANIMATION_TIME_DIALATION = 2.0;
const String PARAM_CONTACTS_KEY = 'contact';

const String CONTACT_DEFAULT_ICON = 'assets/images/contact_icon.png';

GlobalKey<NavigatorState> globalKey = GlobalKey();

// Messages
const String DELETE_CONFIRMATION = "Are you sure you want to delete contact";
