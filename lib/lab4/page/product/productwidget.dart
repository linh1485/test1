import 'package:flutter/material.dart';
import 'package:lab2/lab4/data/model/productmodel.dart';
import 'package:lab2/lab4/data/provider/productprovider.dart';
import 'package:lab2/lab4/conf/const.dart';
import 'package:lab2/lab4/page/product/productbody.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({super.key});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  List<Product> lstProduct = [];
  late Future<void> _loadFuture;

  Future<void> loadProductList() async {
    lstProduct = await ProductProvider().loadData();
  }

  @override
  void initState() {
    super.initState();
    _loadFuture = loadProductList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: _loadFuture,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(
              child: Column(
                children: [
                  const Text(
                    "Product list",
                    style: titleStyle,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: lstProduct.length,
                          itemBuilder: (context, index) {
                            return itemProductView(lstProduct[index]);
                          }))
                ],
              ),
            );
          }
        });
  }
}
