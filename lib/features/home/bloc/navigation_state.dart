part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState extends Equatable {
  final String title;
  const NavigationState(this.title);

  @override
  List<Object> get props => [title];
}

class CategoryState extends NavigationState {
  CategoryState(super.title);
}

class ProductState extends NavigationState {
  final String categoryName;
  const ProductState(this.categoryName, super.title);
}

class HomeState extends NavigationState {
  HomeState(super.title);
}

class SettingsState extends NavigationState {
  SettingsState(super.title);
}
