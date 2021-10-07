part of 'management_bloc.dart';

abstract class ManagementEvent extends Equatable {
  const ManagementEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ManagementEvent_Submit extends ManagementEvent{
  final Product product;
  final File? image;

  ManagementEvent_Submit(this.product, this.image);
}