import 'package:flutter/material.dart';
import 'package:visa_test/screens/contact/contact_add_screen.dart';
import 'package:visa_test/screens/contact/contact_edit_screen.dart';
import 'package:visa_test/screens/contact/contact_view_details_screen.dart';
import 'package:visa_test/screens/contact/contacts_list_screen.dart';
import 'package:visa_test/screens/splash_screen.dart';

class Routes {
  static const ROOT = '/';
  static const HOME = '/home';
  static const ADD = '/add';
  static const VIEW = '/view';
  static const EDIT = '/edit';
  static Map<String, WidgetBuilder> buildRoutes() {
    Map<String, WidgetBuilder> routes = new Map<String, WidgetBuilder>();
    routes.putIfAbsent(ROOT, () => (_) => SplashScreen());
    routes.putIfAbsent(HOME, () => (_) => ContactsHome());
    routes.putIfAbsent(ADD, () => (_) => AddContactScreen());
    routes.putIfAbsent(VIEW, () => (_) => ViewContactDetailsScreen());
    routes.putIfAbsent(EDIT, () => (_) => EditContactScreen());
    return routes;
  }
}
