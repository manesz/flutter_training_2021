import 'package:demo0/src/pages/pages.dart';
import 'package:flutter/cupertino.dart';

class AppRoute {
  static const home = 'home';
  static const login = 'login';
  static const management = 'management';
  static const map = 'map';

  get getAll => <String, WidgetBuilder> {
    login: (context) => const LoginPage(),
    home: (context) => const HomePage(),
    management: (context) => const ManagementPage(),
    map: (context) => const MapPage(),
  };
}