import 'package:flutter/material.dart';
import 'package:lab2/lab6/page/homewidget.dart';
import 'package:lab2/lab6/page/category/category_list.dart';
import 'package:lab2/lab6/page/product/product_list.dart';

class MainpageLab6 extends StatefulWidget {
  const MainpageLab6({Key? key}) : super(key: key);

  @override
  State<MainpageLab6> createState() => _MainpageState();
}

class _MainpageState extends State<MainpageLab6> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    CategoryList(),
    ProductList()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Product',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 11, 7, 233),
        onTap: _onItemTapped,
      ),
    ));
  }
}
