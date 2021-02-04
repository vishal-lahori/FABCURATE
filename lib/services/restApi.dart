import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class RestAPI {
  BuildContext _context;
  RestAPI({context}) {
    _context = context;
  }

// Home URL
  Future<Response> getHomeScreenData() async {
    Response response =
        await post("https://fabcurate.easternts.com/get_home_content");

    return response;
  }

// Category URL
  Future<Response> categoryScreenData() async {
    Response response =
        await post("https://fabcurate.easternts.com/get_categories");

    return response;
  }
}
