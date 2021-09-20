import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visa_test/utils/screen_utils.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:visa_test/view_models/contact_bloc.dart';
import 'package:visa_test/view_models/contact_events.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timeDilation = 1.2;
    loadContacts();
  }

  loadContacts() async {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<ContactBloc>().add(FetchContactsEvent());
      openHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
