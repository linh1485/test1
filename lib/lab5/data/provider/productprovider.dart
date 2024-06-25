import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:lab2/lab5/data/model/productmodel.dart';

class ReadData {
  Future<List<Product>> loadData() async {
    var data =
        await rootBundle.loadString("assets/lab5_files/productlist.json");
    var jsonData = jsonDecode(data);

    if (jsonData['data'] == null) {
      return [];
    }

    return (jsonData['data'] as List).map((e) => Product.fromJson(e)).toList();
  }

  Future<Iterable<Product>> loadDataByCat(int catId) async {
    var data =
        await rootBundle.loadString("assets/lab5_files/productlist.json");
    var jsonData = jsonDecode(data);
    return (jsonData['data'] as List)
        .map((e) => Product.fromJson(e))
        .where((e) => e.catId == catId)
        .toList();
  }
}
