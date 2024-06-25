import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:lab2/lab4/data/model/productmodel.dart';

class ProductProvider {
  Future<List<Product>> loadData() async {
    var data =
        await rootBundle.loadString("assets/lab4_files/productlist.json");
    var jsonData = jsonDecode(data);

    if (jsonData['data'] == null) {
      return [];
    }

    return (jsonData['data'] as List).map((e) => Product.fromJson(e)).toList();
  }
}
