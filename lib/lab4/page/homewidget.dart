import 'package:flutter/material.dart';
import 'package:lab2/lab4/conf/const.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Home page",
        style: titleStyle,
      ),
    );
  }
}
