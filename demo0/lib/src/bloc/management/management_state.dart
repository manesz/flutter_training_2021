part of 'management_bloc.dart';

enum SubmittingStatus { submitting, success, faild, init }

class ManagementState extends Equatable {
  const ManagementState(this.status);

  final SubmittingStatus status;

  copyWith({
    List<Product>? products,
    FetchStatus? status,
  }) {
    return HomeState(
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return '''HomeState { productsLen: ${products.length}, status: $status }''';
  }

  @override
  List<Object> get props => [status];
}
