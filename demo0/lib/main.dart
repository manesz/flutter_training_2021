import 'package:demo0/src/app.dart';
import 'package:demo0/src/bloc/app_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
