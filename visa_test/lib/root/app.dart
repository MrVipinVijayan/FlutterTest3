import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visa_test/constants/constants.dart';
import 'package:visa_test/repo/contact_repo.dart';
import 'package:visa_test/routes/routes.dart';
import 'package:visa_test/theme/app_theme.dart';
import 'package:visa_test/view_models/contact_bloc.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactBloc(contactRepo: ContactServices()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: globalKey,
        themeMode: ThemeMode.light,
        theme: AppTheme.appTheme,
        initialRoute: '/',
        routes: Routes.buildRoutes(),
      ),
    );
  }
}
