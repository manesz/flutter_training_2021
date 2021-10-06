import 'package:demo0/src/pages/home/home_v2_page.dart';
import 'package:demo0/src/pages/pages.dart';
import 'package:flutter/cupertino.dart';

class AppRoute {
  static const home = 'home';
  static const home_v2 = 'home_v2';
  static const login = 'login';
  static const management = 'management';
  static const map = 'map';

  get getAll => <String, WidgetBuilder>{
        login: (context) => const LoginPage(),
        home: (context) => const HomePage(),
        home_v2: (context) => const HomePageV2(),
        management: (context) => const ManagementPage(),
        map: (context) => const MapPage(),
      };
}
