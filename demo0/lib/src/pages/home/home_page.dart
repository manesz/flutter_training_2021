import 'package:demo0/src/configs/app_routes.dart';
import 'package:demo0/src/constants/app_setting.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove(AppSetting.token);
              prefs.remove(AppSetting.username);
              Navigator.pushReplacementNamed(context, AppRoute.login);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text("1234");
        },
        itemCount: 10,
      ),
    );
  }
}
