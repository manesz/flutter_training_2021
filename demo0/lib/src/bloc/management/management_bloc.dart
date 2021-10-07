import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:demo0/src/models/product.dart';
import 'package:demo0/src/services/network_service.dart';
import 'package:demo0/src/widgets/custom_flushbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../app.dart';

part 'management_event.dart';

part 'management_state.dart';

class ManagementBloc extends Bloc<ManagementEvent, ManagementState> {
  ManagementBloc() : super(ManagementState()) {
    on<ManagementEvent_Submit>(mapStateToManagementEvent_Submit);
  }

  mapStateToManagementEvent_Submit(event, emit) async {

    // Debug
    // emit(state.copyWith(status: SubmitStatus.submitting));
    // await Future.delayed(Duration(seconds: 2));
    // emit(state.copyWith(status: SubmitStatus.success));

    final _product = event.product;
    final _imageFile = event.image;
    final _editMode = event.editMode;
    final _form = event.form;

    emit(state.copyWith(status: SubmitStatus.submitting));
    FocusScope.of(navigatorState.currentContext!).requestFocus(FocusNode());
    _form.currentState?.save();
    try {
      CustomFlushbar.showLoading(navigatorState.currentContext!);
      String result;
      if (_editMode) {
        result = await NetworkService().editProduct(_product, imageFile: _imageFile);
      } else {
        logger.i("Add Product : $_product");
        result = await NetworkService().addProduct(_product, imageFile: _imageFile);
      }
      CustomFlushbar.close(navigatorState.currentContext!);
      Navigator.pop(navigatorState.currentContext!);

      emit(state.copyWith(status: SubmitStatus.success));
      // CustomFlushbar.showSuccess(context, message: result);
    } catch (exception) {
      CustomFlushbar.showError(navigatorState.currentContext!, message: 'network fail');
      emit(state.copyWith(status: SubmitStatus.faild));
    }
  }
}
