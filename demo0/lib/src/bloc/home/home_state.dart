part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({required this.products});
  final List<Product> products;

  copyWith({required List<Product> products}) {
    return HomeState(products: products);
  }

  @override
  List<Object> get props => [products];
}
