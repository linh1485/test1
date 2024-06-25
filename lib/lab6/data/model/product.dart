import 'dart:convert';

class Product_Model {
  final int? id;
  final String name;
  final int? price;
  final String img;
  final String des;
  // final int? catId;
  //constructor
  Product_Model({
    this.id,
    required this.name,
    this.price,
    required this.img,
    required this.des,
    // this.catId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'img': img,
      'desc': des,
      // 'catid': catId
    };
  }

  factory Product_Model.fromMap(Map<String, dynamic> map) {
    return Product_Model(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      price: map['price']?.toInt(),
      img: map['img'] ?? '',
      des: map['desc'] ?? '',
      // catId: map['catid']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product_Model.fromJson(String source) =>
      Product_Model.fromMap(json.decode(source));

  @override
  String toString() =>
      'Product(id:$id, name:$name, price:$price, img:$img, desc:$des)';
}
