import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../../helpers/app_constant.dart';
import '../models/product_data_ui_model.dart';

class ProductsRepo {
  static Future<ProductDataUiModel?> fetchProducts(String name) async {
    var client = http.Client();
    ProductDataUiModel product = ProductDataUiModel();
    try {
      // var uri = Uri.parse(
      //   'https://dummyjson.com/products/category/$name',
      // );
      // print(uri);
      var response = await client.get(Uri.parse(
        '${BaseUrl.baseApi}products/category/$name',
      ));

      product = ProductDataUiModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      // for (int i = 0; i < result.length; i++) {
      //   ProductDataUiModel product =
      //       ProductDataUiModel.fromJson(result[i] as Map<String, dynamic>);
      //   products.add(product);
      // }
      return product;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
