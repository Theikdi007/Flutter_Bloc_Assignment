import 'package:blocproject/helpers/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/app_drawer_widget.dart';
import '../../categories/ui/categories_page.dart';
import '../../products/ui/products_page.dart';
import '../bloc/navigation_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.colorWhite,
        title: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return Text(
              state.title,
              style: const TextStyle(
                fontSize: FontSize.textSizeLarge,
                color: MyColor.colorBlueGray,
                fontWeight: FontWeight.w500,
              ),
            );
          },
        ),
        centerTitle: true,
      ),
      drawer: AppDrawerWidget(),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is CategoryState) {
            return const CategoriesPage();
          } else if (state is ProductState) {
            return ProductsPage(
              categoryName: state.categoryName,
            );
          }
          return Container();
        },
      ),
    );
  }
}
