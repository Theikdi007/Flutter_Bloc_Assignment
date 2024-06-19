part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class ProductsInitialFetchEvent extends ProductsEvent {
  final String name;
  const ProductsInitialFetchEvent(this.name);
  @override
  List<Object> get props => [name];
}
