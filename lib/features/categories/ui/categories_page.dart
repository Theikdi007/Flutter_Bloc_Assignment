import 'package:blocproject/features/categories/bloc/categories_bloc.dart';
import 'package:blocproject/helpers/app_constant.dart';
import 'package:blocproject/widgets/empty_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/bloc/navigation_bloc.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final CategoriesBloc categoriesBloc = CategoriesBloc();
  @override
  void initState() {
    categoriesBloc.add(CategoriesInitialFetchEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.colorGreyLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: RefreshIndicator(
          onRefresh: () async =>
              categoriesBloc.add(CategoriesInitialFetchEvent()),
          child: BlocConsumer<CategoriesBloc, CategoriesState>(
            bloc: categoriesBloc,
            listenWhen: (previous, current) => current is CategoriesActionState,
            buildWhen: (previous, current) => current is! CategoriesActionState,
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case CategoriesFetchingLoadingState:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case CategoriesFetchingErrorState:
                  return Center(
                    child: AsyncLoaderHelperWidget.emptyView(
                        text: "This is Empty.",
                        onPress: () {
                          categoriesBloc.add(CategoriesInitialFetchEvent());
                        }),
                  );
                case CategoryFetchingSuccessfullSate:
                  final successState = state as CategoryFetchingSuccessfullSate;

                  return SizedBox(
                    child: ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: successState.categories.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (index == 0) ...[
                              const SizedBox(
                                height: 15,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                                child: const Text(
                                  'Categories',
                                  style: TextStyle(
                                    fontSize: FontSize.textSizeLarge,
                                    color: MyColor.colorBlueGray,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Divider(
                                thickness: 1,
                                color: MyColor.colorBlueGray500,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                            InkWell(
                              onTap: () {
                                BlocProvider.of<NavigationBloc>(context)
                                    .add(NavigateToProduct(
                                  successState.categories[index].name,
                                ));
                              },
                              child: Container(
                                color: Colors.white,
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  successState.categories[index].name,
                                  style: const TextStyle(
                                    fontSize: FontSize.textSizeNormal,
                                    color: MyColor.colorBlueGray,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                default:
                  return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
