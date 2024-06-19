import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blocproject/features/categories/models/category_data_ui_model.dart';
import 'package:blocproject/features/categories/repos/categories_repo.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesInitialFetchEvent>(categoriesInitialFetchEvent);
  }

  FutureOr<void> categoriesInitialFetchEvent(
      CategoriesInitialFetchEvent event, Emitter<CategoriesState> emit) async {
    emit(CategoriesFetchingLoadingState());
    List<CategoryDataUiModel> categories =
        await CategoriesRepo.fetchCategories();
    if (categories.isEmpty) {
      emit(CategoriesFetchingErrorState());
    } else {
      emit(CategoryFetchingSuccessfullSate(categories: categories));
    }
  }
}
