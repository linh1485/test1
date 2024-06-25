import 'package:flutter/material.dart';
import 'package:lab2/lab5/data/model/categorymodel.dart';
import 'package:lab2/lab5/data/model/productmodel.dart';
import 'package:lab2/lab5/data/provider/productprovider.dart';

import 'package:lab2/lab5/page/product/productbody.dart';

class ProductWidget extends StatefulWidget {
  final Category objCat;
  const ProductWidget({Key? key, required this.objCat}) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  List<Product> lstProduct = [];

  Future<String> loadProductList(int catId) async {
    lstProduct = await ReadData().loadDataByCat(catId) as List<Product>;
    return '';
  }

  @override
  void initState() {
    super.initState;
    loadProductList(widget.objCat.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Product List ${widget.objCat.name.toString().toUpperCase()}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: loadProductList(widget.objCat.id!),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return GridView.builder(
                itemCount: lstProduct.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing: 4,
                    mainAxisExtent: 8),
                itemBuilder: (context, index) {
                  return itemGridWiew(lstProduct[index]);
                });
          },
        ),
      ),
    );
  }
}
