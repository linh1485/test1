import 'package:flutter/material.dart';
import 'lab3/mainpage.dart';
import 'lab1/stateful.dart';
import 'lab2/page/list.dart';
import 'lab2/page/grid.dart';
import 'lab2/page/carousel.dart';
import 'lab4/mainpage.dart';
import 'lab5/mainpagelab5.dart';
import 'lab6/mainpage.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyStateful()),
              );
            },
            child: Text('Lab1-Stateful'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyList()),
              );
            },
            child: Text('Lab2-List'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyGrid()),
              );
            },
            child: Text('Lab2-Grid'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCarousel()),
              );
            },
            child: Text('Lab2-Carousel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mainpage()),
              );
            },
            child: Text('Lab3'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainpageLab4()),
              );
            },
            child: Text('Lab4'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mainpagelab5()),
              );
            },
            child: Text('Lab5'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainpageLab6()),
              );
            },
            child: Text('Lab6'),
          ),
        ],
      )),
    );
  }
}
