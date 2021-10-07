part of 'management_bloc.dart';

abstract class ManagementState extends Equatable {
  const ManagementState();
}

class ManagementInitial extends ManagementState {
  @override
  List<Object> get props => [];
}
