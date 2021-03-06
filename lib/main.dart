import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:xpress_drive/app/app.locator.dart';
import 'package:xpress_drive/app/app.router.dart';
import 'package:xpress_drive/ui/setup_dialog_ui.dart';

void main() {
  configureDependencies();
  setupSnackbarUi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  AppRouter get router => locator<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.defaultRouteParser(),
      routerDelegate: AutoRouterDelegate(
        router,
      ),
      builder: EasyLoading.init(),
      routeInformationProvider: router.routeInfoProvider(),
      theme: ThemeData(
        fontFamily: 'Gilroy-Regular',
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
