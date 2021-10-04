import 'dart:ffi';

import 'package:demo0/src/configs/app_routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: [
          IconButton(
            onPressed: () {
              print(DateTime.now());
              Navigator.pushNamed(context, AppRoute.home);
            },
            icon: Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("/assets/images/logo.png"),
            Text("Y"),
            Text("Z"),
          ],
        ),
      ),
    );
  }
}
