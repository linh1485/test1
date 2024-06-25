import 'package:flutter/material.dart';
import 'package:lab2/lab5/data/model/categorymodel.dart';
import 'package:lab2/lab5/data/provider/categoryprovider.dart';
import 'package:lab2/lab5/page/category/categorybody.dart';
import 'package:lab2/lab5/conf/const.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  List<Category> lstCate = [];
  Future<String> loadCateList() async {
    lstCate = await ReadData().loadData();
    return '';
  }

  @override
  void initState() {
    super.initState();
    loadCateList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadCateList(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Center(
          child: Column(
            children: [
              const Text(
                "Category list",
                style: titleStyle,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: lstCate.length,
                itemBuilder: (context, index) {
                  return itemCateView(lstCate[index], context);
                },
              ))
            ],
          ),
        );
      },
    );
  }
}
