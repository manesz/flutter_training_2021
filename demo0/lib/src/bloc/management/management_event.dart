part of 'management_bloc.dart';

abstract class ManagementEvent extends Equatable {
  const ManagementEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ManagementEvent_Submit extends ManagementEvent{
  final Product _product;
  final File? _image;

  ManagementEvent_Submit(this._product, this._image);
}