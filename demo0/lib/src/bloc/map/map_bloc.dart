import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo0/src/app.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc() : super(MapInitial()) {
    on<MapEvent_SubmitLocation>(_mapStateToSubmitLocation);
  }

  FutureOr<void> _mapStateToSubmitLocation(MapEvent_SubmitLocation event, Emitter<MapState> emit) {
    logger.i("Location : ${event.position}");
  }
}
