import 'package:flutter/material.dart';
import 'package:lab2/lab2/data/model.dart';
import '../data/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../config/const.dart';

class MyCarousel extends StatefulWidget {
  const MyCarousel({super.key});

  @override
  State<MyCarousel> createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  List<ProductModel> lstProduct = [];
  @override
  void initState() {
    super.initState();
    lstProduct = createDataList(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My carousel: Do Ai Linh"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: slide(lstProduct),
      ),
    );
  }

  Widget slide(List<ProductModel> listProduct) {
    return CarouselSlider(
        options: CarouselOptions(
          autoPlay: true, //tu dong chay
          aspectRatio: 2.0,
          enlargeCenterPage: true, // o giua
        ),
        items: listProduct
            .map(
              (item) => Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        url_img + item.img!,
                        fit: BoxFit.fitHeight,
                        width: 1000.0,
                      ),
                      Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(199, 221, 69, 69),
                                  Color.fromARGB(0, 0, 0, 0),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(
                              item.name!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            )
            .toList());
  }
}
