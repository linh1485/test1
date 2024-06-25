import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lab2/lab5/data/model/productmodel.dart';
import 'package:lab2/lab5/conf/const.dart';

Widget itemGridWiew(Product productModel) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            url_product_img + productModel.img!,
            height: 80,
            width: 80,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image),
          ),
          Text(
            productModel.name ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          Text(
            "Price: ${NumberFormat('###,###.###').format(productModel.price)}",
            style: const TextStyle(fontSize: 13, color: Colors.red),
          ),
          Text(
            productModel.des!,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
        ],
      ),
    );
  }