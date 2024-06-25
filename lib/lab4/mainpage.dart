import 'package:flutter/material.dart';
import 'package:lab2/lab4/page/category/categorywidget.dart';
import 'package:lab2/lab4/page/product/productwidget.dart';
import 'package:lab2/lab4/page/homewidget.dart';

class MainpageLab4 extends StatefulWidget {
  const MainpageLab4({super.key});

  @override
  State<MainpageLab4> createState() => _MainpageLab4State();
}

class _MainpageLab4State extends State<MainpageLab4> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    CategoryWidget(),
    ProductWidget(),
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
        appBar: AppBar(
          title: const Text('List Product'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
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
              icon: Icon(Icons.list_rounded),
              label: 'Product',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 11, 7, 233),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
