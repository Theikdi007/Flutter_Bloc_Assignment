part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

sealed class CategoriesActionState extends CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesFetchingLoadingState extends CategoriesState {}

final class CategoriesFetchingErrorState extends CategoriesState {}

final class CategoryFetchingSuccessfullSate extends CategoriesState {
  late final List<CategoryDataUiModel> categories;
  CategoryFetchingSuccessfullSate({required this.categories});
}
