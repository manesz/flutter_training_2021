import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:demo0/src/models/product.dart';
import 'package:equatable/equatable.dart';

part 'management_event.dart';

part 'management_state.dart';

class ManagementBloc extends Bloc<ManagementEvent, ManagementState> {
  ManagementBloc() : super(ManagementState()) {
    on<ManagementEvent_Submit>(mapStateToManagementEvent_Submit);
  }

  mapStateToManagementEvent_Submit(event, emit) {

  }
}
