part of 'management_bloc.dart';

enum FetchStatus { submitting, success, faild, init }

abstract class ManagementState extends Equatable {
  const ManagementState();
}

class ManagementInitial extends ManagementState {
  @override
  List<Object> get props => [];
}
