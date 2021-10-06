import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo0/src/models/product.dart';
import 'package:demo0/src/services/network_service.dart';
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

  Future<HomeState> mapStateToHomeEvent(HomeEvent event, HomeState state) async {
    try {
      final result = await NetworkService().getProduct();
      return state.copyWith(products: result);
    }catch (e){
      return this.state;
    }
  }
}
