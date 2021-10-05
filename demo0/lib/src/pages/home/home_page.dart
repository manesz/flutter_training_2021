import 'package:demo0/src/configs/app_routes.dart';
import 'package:demo0/src/constants/app_setting.dart';
import 'package:demo0/src/services/network_service.dart';
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

    List<String> dummy = ["Angular", "React", "Flutter"];

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(
            onPressed: () async {
              // SharedPreferences prefs = await SharedPreferences.getInstance();
              // prefs.remove(AppSetting.token);
              // prefs.remove(AppSetting.username);
              // Navigator.pushReplacementNamed(context, AppRoute.login);
              final result = await NetworkService().getProduct();
              print(result[0].name);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text(dummy[index]);
        },
        itemCount: dummy.length,
      ),
    );
  }
}
