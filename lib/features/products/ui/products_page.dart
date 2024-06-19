import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../helpers/app_constant.dart';
import '../../../widgets/empty_data_widget.dart';
import '../../home/bloc/navigation_bloc.dart';
import '../bloc/products_bloc.dart';

class ProductsPage extends StatefulWidget {
  String categoryName;
  ProductsPage({super.key, required this.categoryName});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final ProductsBloc productsBloc = ProductsBloc();
  @override
  void initState() {
    productsBloc.add(ProductsInitialFetchEvent(widget.categoryName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        BlocProvider.of<NavigationBloc>(context).add(NavigateToCategory());
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: RefreshIndicator(
          onRefresh: () async =>
              productsBloc.add(ProductsInitialFetchEvent(widget.categoryName)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: BlocConsumer<ProductsBloc, ProductsState>(
              bloc: productsBloc,
              listenWhen: (previous, current) => current is ProductsActionState,
              buildWhen: (previous, current) => current is! ProductsActionState,
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                switch (state.runtimeType) {
                  case ProductsFetchingLoadingState:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ProductsFetchingErrorState:
                    return Center(
                      child: AsyncLoaderHelperWidget.emptyView(
                          text: "This is Empty.",
                          onPress: () {
                            productsBloc.add(
                                ProductsInitialFetchEvent(widget.categoryName));
                          }),
                    );
                  case ProductFetchingSuccessfullSate:
                    final successState =
                        state as ProductFetchingSuccessfullSate;

                    return Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 15,
                          );
                        },
                        shrinkWrap: true,
                        itemCount: successState.product!.products!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              color: Colors.white,
                              child: ListTile(
                                dense: true,
                                minVerticalPadding: 15,
                                visualDensity: const VisualDensity(vertical: 4),
                                contentPadding: const EdgeInsets.only(right: 10),
                                leading: CachedNetworkImage(
                                  width: 120,
                                  height: 200,
                                  fit: BoxFit.cover,
                                  imageUrl: successState.product
                                          ?.products![index].images[0] ??
                                      '',
                                  imageBuilder: (context, image) {
                                    return ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image(
                                          image: image,
                                          width: 120,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ));
                                  },
                                  placeholder: (context, value) => ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/photo_placeholder.png',
                                      width: 120,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/photo_placeholder.png',
                                      width: 120,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                title: Text(
                                  successState
                                          .product?.products![index].title ??
                                      '',
                                  style: const TextStyle(
                                    fontSize: FontSize.textSizeExtraNormal,
                                    color: MyColor.colorBlueGray,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                  successState.product?.products![index]
                                          .description ??
                                      '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: FontSize.textSizeExtraSmall,
                                    color: MyColor.colorBlueGray,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                //trailing: Icon(Icons.navigate_next),
                                onTap: () {
                                  // Handle the tap event
                                },
                              ),
                            ),
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
      ),
    );
  }
}
