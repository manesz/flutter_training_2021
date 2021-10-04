import 'package:demo0/src/configs/app_routes.dart';
import 'package:demo0/src/pages/pages.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo0",
      routes: AppRoute().getAll,
      home: LoginPage()
    );
  }
}
