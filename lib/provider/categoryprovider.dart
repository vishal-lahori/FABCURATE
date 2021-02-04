import 'dart:convert';

import 'package:fabcurate/model/categorymodel.dart';
import 'package:fabcurate/services/restApi.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class CategoryProvider extends ChangeNotifier {
  RestAPI restAPI;

  List<Categories> categories = List<Categories>();

  String bannerImage = "";

  categoryScreenData(BuildContext context) async {
    restAPI = RestAPI(context: context);
    Response response = await restAPI.categoryScreenData();

    if (response != null && response.body != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        CategoryModel categoryModel =
            CategoryModel.fromJson(jsonDecode(response.body));

        if (categoryModel.bannerImage != null) {
          bannerImage = categoryModel.bannerImage;
        }
        if (categoryModel.categories != null) {
          categories = categoryModel.categories;
        }

        notifyListeners();
      }
    }
  }
}
