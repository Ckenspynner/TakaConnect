import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:takaconnect/utils/http_strings.dart';

class ProductSellersService {
  ///////////////////////////////////////////////////////////////-------------MOMBASA
  Future<ListOfMombasaProductSellers> getMombasaProductSellers() async {
    var response = await http.get(Uri.parse(mombasaproductsellersUrl));
    //print(jsonDecode(response.body));
    return ListOfMombasaProductSellers.fromJson(jsonDecode(response.body));
  }

  ///////////////////////////////////////////////////////////////-------------TanaRiver
  Future<ListOfTanaRiverProductSellers> getTanaRiverProductSellers() async {
    var response = await http.get(Uri.parse(tanariverproductsellersUrl));
    //print(jsonDecode(response.body));
    return ListOfTanaRiverProductSellers.fromJson(jsonDecode(response.body));

  } ///////////////////////////////////////////////////////////////-------------Lamu
  Future<ListOfLamuProductSellers> getLamuProductSellers() async {
    var response = await http.get(Uri.parse(lamuproductsellersUrl));
    //print(jsonDecode(response.body));
    return ListOfLamuProductSellers.fromJson(jsonDecode(response.body));
  }

  ///////////////////////////////////////////////////////////////-------------Kilifi
  Future<ListOfKilifiProductSellers> getKilifiProductSellers() async {
    var response = await http.get(Uri.parse(kilifiproductsellersUrl));
    //print(jsonDecode(response.body));
    return ListOfKilifiProductSellers.fromJson(jsonDecode(response.body));
  }

  ///////////////////////////////////////////////////////////////-------------Kwale
  Future<ListOfKwaleProductSellers> getKwaleProductSellers() async {
    var response = await http.get(Uri.parse(kwaleproductsellersUrl));
    //print(jsonDecode(response.body));
    return ListOfKwaleProductSellers.fromJson(jsonDecode(response.body));
  }

  ///////////////////////////////////////////////////////////////-------------TaitaTaveta
  Future<ListOfTaitaTavetaProductSellers> getTaitaTavetaProductSellers() async {
    var response = await http.get(Uri.parse(taitatavetaproductsellersUrl));
    //print(jsonDecode(response.body));
    return ListOfTaitaTavetaProductSellers.fromJson(jsonDecode(response.body));
  }
}

///////////////////////////////////////////////////////////////-------------MOMBASA
class ListOfMombasaProductSellers {
  List<Product> productSellers = [];

  ListOfMombasaProductSellers({required this.productSellers});

  factory ListOfMombasaProductSellers.fromJson(List list) {
    List<Product> _productSellers = [];

    list.forEach((element) {
      _productSellers.add(Product.fromJson(element));
    });
    //print(_productSellers[1].description);
    return ListOfMombasaProductSellers(productSellers: _productSellers);
  }
}

///////////////////////////////////////////////////////////////-------------TanaRiver
class ListOfTanaRiverProductSellers {
  List<Product> productSellers = [];

  ListOfTanaRiverProductSellers({required this.productSellers});

  factory ListOfTanaRiverProductSellers.fromJson(List list) {
    List<Product> _productSellers = [];

    list.forEach((element) {
      _productSellers.add(Product.fromJson(element));
    });
    //print(_productSellers[1].description);
    return ListOfTanaRiverProductSellers(productSellers: _productSellers);
  }
}

///////////////////////////////////////////////////////////////-------------Kilifi
class ListOfKilifiProductSellers {
  List<Product> productSellers = [];

  ListOfKilifiProductSellers({required this.productSellers});

  factory ListOfKilifiProductSellers.fromJson(List list) {
    List<Product> _productSellers = [];

    list.forEach((element) {
      _productSellers.add(Product.fromJson(element));
    });
    //print(_productSellers[1].description);
    return ListOfKilifiProductSellers(productSellers: _productSellers);
  }
}


///////////////////////////////////////////////////////////////-------------Lamu
class ListOfLamuProductSellers {
  List<Product> productSellers = [];

  ListOfLamuProductSellers({required this.productSellers});

  factory ListOfLamuProductSellers.fromJson(List list) {
    List<Product> _productSellers = [];

    list.forEach((element) {
      _productSellers.add(Product.fromJson(element));
    });
    //print(_productSellers[1].description);
    return ListOfLamuProductSellers(productSellers: _productSellers);
  }
}

///////////////////////////////////////////////////////////////-------------Kwale
class ListOfKwaleProductSellers {
  List<Product> productSellers = [];

  ListOfKwaleProductSellers({required this.productSellers});

  factory ListOfKwaleProductSellers.fromJson(List list) {
    List<Product> _productSellers = [];

    list.forEach((element) {
      _productSellers.add(Product.fromJson(element));
    });
    //print(_productSellers[1].description);
    return ListOfKwaleProductSellers(productSellers: _productSellers);
  }
}

///////////////////////////////////////////////////////////////-------------TaitaTaveta
class ListOfTaitaTavetaProductSellers {
  List<Product> productSellers = [];

  ListOfTaitaTavetaProductSellers({required this.productSellers});

  factory ListOfTaitaTavetaProductSellers.fromJson(List list) {
    List<Product> _productSellers = [];

    list.forEach((element) {
      _productSellers.add(Product.fromJson(element));
    });
    //print(_productSellers[1].description);
    return ListOfTaitaTavetaProductSellers(productSellers: _productSellers);
  }
}

class Product {
  int id;
  String image;
  String seller;
  int quantity;
  String contact;
  String category;
  String categorytype;
  String itemcolor;
  String location;
  String description;

  final String title, materialType, phone, county;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.image,
    required this.seller,
    required this.contact,
    required this.quantity,
    required this.category,
    required this.categorytype,
    required this.itemcolor,
    required this.location,
    required this.materialType,
    required this.colors,
    required this.phone,
    required this.images,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    required this.county,
  });

  factory Product.fromJson(mapOfBody) {
    // print(mapOfBody["key"]);
    //print(mapOfBody["county"]);

    return Product(
        id: mapOfBody["id"],
        image: mapOfBody["image"],
        seller: mapOfBody["seller"],
        contact: mapOfBody["contact"],
        quantity: mapOfBody["quantity"],
        category: mapOfBody["category"],
        categorytype: mapOfBody["categorytype"],
        itemcolor: mapOfBody["color"],
        location: mapOfBody["location"],
        materialType: '',
        colors: [],
        phone: '',
        images: [],
        title: '',
        price: 30,
        description: mapOfBody["description"],
        county: mapOfBody["county"]);
  }
}

List<Product> demoCategories = [
  Product(
    id: 1,
    images: [
      "assets/images/wood.png",
      "assets/images/wood1.png",
      "assets/images/wood2.png",
      //"assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Organics",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    materialType: 'Saw Dust',
    quantity: 20,
    location: 'Mombasa',
    county: 'Kisauni',
    phone: '0710234567',
    image: '',
    seller: '',
    contact: '',
    category: '',
    categorytype: '',
    itemcolor: '',
  ),
];

const String description =
    "This section will contain details description of the product …";

// Product(
// id: 1,
// images: [
// "assets/images/wood.png",
// "assets/images/wood1.png",
// "assets/images/wood2.png",
// //"assets/images/ps4_console_white_4.png",
// ],
// colors: [
// Color(0xFFF6625E),
// Color(0xFF836DB8),
// Color(0xFFDECB9C),
// Colors.white,
// ],
// title: "Organics",
// price: 64.99,
// description: description,
// rating: 4.8,
// isFavourite: true,
// isPopular: true,
// materialType: 'Saw Dust',
// color: 'Brown',
// quantity: '20',
// location: 'Mombasa',
// county: 'Kisauni',
// phone: '0710234567',
// ),
