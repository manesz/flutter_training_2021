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
  List<Object> get props {
    return [products, status];
  }
}


