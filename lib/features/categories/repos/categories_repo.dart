import 'dart:convert';
import 'dart:developer';

import 'package:blocproject/features/categories/models/category_data_ui_model.dart';
import 'package:http/http.dart' as http;

import '../../../helpers/app_constant.dart';

class CategoriesRepo {
  static Future<List<CategoryDataUiModel>> fetchCategories() async {
    var client = http.Client();
    List<CategoryDataUiModel> categories = [];
    try {
      var response =
          await client.get(Uri.parse('${BaseUrl.baseApi}products/categories/'));
      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        CategoryDataUiModel category =
            CategoryDataUiModel.fromJson(result[i] as Map<String, dynamic>);
        categories.add(category);
      }
      return categories;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
