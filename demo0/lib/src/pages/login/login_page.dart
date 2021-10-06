import 'dart:ffi';

import 'package:demo0/src/bloc/login/login_bloc.dart';
import 'package:demo0/src/configs/app_routes.dart';
import 'package:demo0/src/constants/app_setting.dart';
import 'package:demo0/src/constants/asset.dart';
import 'package:demo0/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        height: double.infinity,
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
              _textButton(
                  title: "register",
                  onPressed: () {
                    print("register");
                  }),
              _textButton(
                  title: "forgot password",
                  onPressed: () {
                    print("forgot password");
                  }),
            ],
          ),
        ),
      ),
    );
  }

  _textButton({required String title, required VoidCallback onPressed}) => TextButton(
      child: Text(
        title,
        style:
            const TextStyle(color: Colors.white60, fontWeight: FontWeight.w500),
      ),
      onPressed: onPressed,
    );
}

// LoginForm
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
              controller: _usernameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'codemobiles@gmail.com',
                labelText: 'Username',
                icon: Icon(Icons.email),
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter password',
                labelText: 'Password',
                icon: Icon(Icons.password_outlined),
              ),
            ),
            ElevatedButton(onPressed: _login, child: Text("Login")),
          ],
        ),
      ),
    );
  }


  void _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final User user = User(username, password);

    context.read<LoginBloc>().add(LoginEvent_Login(user));
    
    // if (username == 'admin' && password == 'password') {
    //   // method 1
    //   //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage(),),);
    //
    //   // method 2
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   await prefs.setString(AppSetting.token, 'TExkgk0494oksrkf');
    //   await prefs.setString(AppSetting.username, username);
    //
    //   Navigator.pushReplacementNamed(context, AppRoute.home);
    // }else{
    //   print("Login failed");
    // }
  }
}
