import 'package:demo0/src/configs/app_routes.dart';
import 'package:demo0/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/app_setting.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo0",
      routes: AppRoute().getAll,
      home: _initialPage()
    );
  }
}

_initialPage() async {


  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString(AppSetting.token) ?? "";
  return token.isEmpty ? LoginPage() : HomePage();
}
