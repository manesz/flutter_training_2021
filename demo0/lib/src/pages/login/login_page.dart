import 'dart:ffi';

import 'package:demo0/src/configs/app_routes.dart';
import 'package:demo0/src/constants/asset.dart';
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
        color: Colors.black87,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
              ),
              Image.asset(Asset.logoImage),
              SizedBox(
                height: 30,
              ),
              LoginForm(),
              _textButton("register"),
              _textButton("forgot password"),
            ],
          ),
        ),
      ),
    );
  }

  _textButton(String title) {
    return TextButton(child: Text(title), onPressed: (){},);
  }
}

// LoginForm
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 24, left: 32, right: 32),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'codemobiles@gmail.com',
                labelText: 'Username',
                icon: Icon(Icons.email),
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter password',
                labelText: 'Password',
                icon: Icon(Icons.password_outlined),
              ),
            ),
            ElevatedButton(onPressed: (){}, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
