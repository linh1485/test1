import 'package:flutter/material.dart';
import 'package:lab2/lab4/data/model/productmodel.dart';
import 'package:lab2/lab4/conf/const.dart';

Widget itemProductView(Product itemProduct) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: const BoxDecoration(color: Color.fromARGB(255, 139, 171, 231)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 150,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Image.asset(
            urlimg + itemProduct.img!,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          itemProduct.name ?? '',
          style: titleStyle,
        ),
        const SizedBox(height: 4),
        Text(
          '\$${itemProduct.price}',
          style: TextStyle(color: Colors.grey[600]),
        ),
        const SizedBox(height: 4),
        Text(
          itemProduct.des ?? '',
          style: TextStyle(color: Colors.grey[800]),
        ),
      ],
    ),
  );
}
