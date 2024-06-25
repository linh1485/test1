import 'package:flutter/material.dart';
import 'package:lab2/lab5/page/homewidget.dart';
import 'package:lab2/lab5/page/category/categorywidget.dart';
import 'package:lab2/lab5/page/register/registerwidget.dart';
import 'package:lab2/lab5/page/account/accountwidget.dart';

class Mainpagelab5 extends StatefulWidget {
  const Mainpagelab5({Key? key}) : super(key: key);

  @override
  State<Mainpagelab5> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpagelab5> {
  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    CategoryWidget(),
    RegisterWidget(),
    AccountWidget()
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
            icon: Icon(Icons.person),
            label: 'Register',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 11, 7, 233),
        onTap: _onItemTapped,
      ),
    ));
  }
}
