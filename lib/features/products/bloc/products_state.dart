part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

sealed class ProductsActionState extends ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsFetchingLoadingState extends ProductsState {}

final class ProductsFetchingErrorState extends ProductsState {}

final class ProductFetchingSuccessfullSate extends ProductsState {
  final ProductDataUiModel? product;
  ProductFetchingSuccessfullSate({required this.product});
}
