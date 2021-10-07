import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo0/src/models/product.dart';
import 'package:demo0/src/services/network_service.dart';
import 'package:equatable/equatable.dart';

import '../../app.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {

    on<HomeEvent_Fetch>(mapStateToHomeEvent);

  }

  mapStateToHomeEvent(HomeEvent_Fetch event, Emitter emit) async {
    try {
      emit(state.copyWith(
        products: [],
        status: FetchStatus.fetching,
      ));

      final result = await NetworkService().getProduct();

      emit(state.copyWith(
        products: result,
        status: FetchStatus.success,
      ));
    } catch (e) {
      emit(state);
    }
  }
}
