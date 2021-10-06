import 'package:demo0/src/bloc/home/home_bloc.dart';
import 'package:demo0/src/configs/app_routes.dart';
import 'package:demo0/src/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/login/login_bloc.dart';
import 'constants/app_setting.dart';

final formatCurrency = NumberFormat('#,###.00');
final formatNumber = NumberFormat('#,###');
final navigatorState = GlobalKey<NavigatorState>();


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
          title: "Demo0",
          routes: AppRoute().getAll,
          home: _initialPage()
      ),
    );
  }
}

_initialPage() {
  return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        // default view for transient duration
        if (!snapshot.hasData) {
          return Container(color: Colors.white);
        }

        final token = snapshot.data?.getString(AppSetting.token) ?? "";
        return token.isEmpty ? LoginPage() : HomePage();
      });
}
