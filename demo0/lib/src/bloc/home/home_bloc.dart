import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo0/src/models/product.dart';
import 'package:demo0/src/services/network_service.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeEvent>((event, emit) async* {
      if (event is HomeEvent_Fetch) {
        yield mapStateToHomeEvent(event, state);
      }
    });
  }

  Future<HomeState> mapStateToHomeEvent(
      HomeEvent event, HomeState state) async {
    try {
      final result = await NetworkService().getProduct();
      return state.copyWith(
        products: result,
        status: FetchStatus.success,
      );
    } catch (e) {
      return this.state;
    }
  }
}
