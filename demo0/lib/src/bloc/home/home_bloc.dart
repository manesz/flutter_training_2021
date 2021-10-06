import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo0/src/models/product.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeEvent>((event, emit) {
      if (event is HomeEvent_Fetch){
        mapStateToHomeEvent(event, state);
      }
    });
  }

  void mapStateToHomeEvent(HomeEvent event, HomeState state) {

  }
}
