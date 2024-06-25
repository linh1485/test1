import 'package:flutter/material.dart';
import 'package:lab2/lab6/data/model/product.dart';
import 'package:lab2/lab6/data/helper/db_helper.dart';
import 'package:lab2/lab6/page/product/product_add.dart';
import 'package:intl/intl.dart';

class ProductBuilder extends StatefulWidget {
  const ProductBuilder({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductBuilder> createState() => _ProductBuilderState();
}

class _ProductBuilderState extends State<ProductBuilder> {
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  Future<List<Product_Model>> _getProducts() async {
    return await _databaseHelper.products();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product_Model>>(
      future: _getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
            child: Text('No products found'),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final itemPro = snapshot.data![index];
              return _buildProduct(itemPro, context);
            },
          ),
        );
      },
    );
  }

  Widget _buildProduct(Product_Model productModel, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[300],
            ),
            alignment: Alignment.center,
            child: Text(
              productModel.id.toString(),
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Image.asset(
            productModel.img,
            height: 80,
            width: 80,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image),
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.name,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "Price: ${NumberFormat('###,###.###').format(productModel.price)}",
                style: const TextStyle(fontSize: 14, color: Colors.red),
              ),
              Text(
                productModel.des,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  DatabaseHelper().deleteCategory(productModel.id!);
                });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (_) => ProductAdd(
                            isUpdate: true,
                            productModel: productModel,
                          ),
                          fullscreenDialog: true,
                        ),
                      )
                      .then((_) => setState(() {}));
                });
              },
              icon: Icon(
                Icons.edit,
                color: Colors.yellow.shade800,
              ))
        ],
      ),
    );
  }
}
