import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(CategoryState('Home')) {
    on<NavigateToCategory>((event, emit) {
      emit(CategoryState('Home'));
    });
    on<NavigateToProduct>((event, emit) {
      emit(ProductState(
        event.categoryName,
        'Product',
      ));
    });
    on<NavigateToHome>((event, emit) {
      emit(HomeState('Home'));
    });
  }

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateToCategory) {
      yield CategoryState('Category');
    } else if (event is NavigateToProduct) {
      yield ProductState('Product', '');
    } else if (event is NavigateToHome) {
      yield HomeState('Home');
    }
  }
}
