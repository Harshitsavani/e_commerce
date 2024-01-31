import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class controller extends ChangeNotifier {
  Dio dio = Dio();
  Map m = {};
  List data = [];
  Map searching = {};

  Future get_data() async {
    print('object');
    final response = await dio.get('https://dummyjson.com/products');
    m = response.data;
    notifyListeners();
  }

  get_search(String search) async {
    final response =
        await dio.get('https://dummyjson.com/products/search?q=${search}');
    searching = response.data;
    notifyListeners();
  }
}
