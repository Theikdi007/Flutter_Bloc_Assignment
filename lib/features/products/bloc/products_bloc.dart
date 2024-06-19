import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../models/product_data_ui_model.dart';
import '../repos/products_repo.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<ProductsInitialFetchEvent>(productsInitialFetchEvent);
  }
  FutureOr<void> productsInitialFetchEvent(
      ProductsInitialFetchEvent event, Emitter<ProductsState> emit) async {
    emit(ProductsFetchingLoadingState());
    ProductDataUiModel? product = await ProductsRepo.fetchProducts(event.name);
    if (product == null) {
      emit(ProductsFetchingErrorState());
    } else {
      if (product.products!.isEmpty) {
        emit(ProductsFetchingErrorState());
      } else {
        emit(ProductFetchingSuccessfullSate(product: product));
      }
    }
  }
}
