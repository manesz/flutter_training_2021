part of 'home_bloc.dart';

enum FetchStatus { fetching, success, faild, init }

class HomeState extends Equatable {
  const HomeState({
    this.products = const [],
    this.status = FetchStatus.init,
  });

  final List<Product> products;
  final FetchStatus status;

  copyWith({
    required List<Product> products,
    FetchStatus? status,
  }) {
    return HomeState(
      products: products,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return '''HomeState { products: $products }''';
  }

  @override
  List<Object> get props => [products, status];
}
