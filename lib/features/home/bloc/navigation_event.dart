part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
  @override
  List<Object> get props => [];
}

class UpdateTitle extends NavigationEvent {
  final String title;

  const UpdateTitle(this.title);

  @override
  List<Object> get props => [title];
}

class NavigateToCategory extends NavigationEvent {}

class NavigateToProduct extends NavigationEvent {
  final String categoryName;

  NavigateToProduct(this.categoryName);
}

class NavigateToHome extends NavigationEvent {}

class NavigateToSettings extends NavigationEvent {}
