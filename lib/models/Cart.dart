import 'package:flutter/material.dart';
import 'package:takaconnect/data_service/products/productsellerservice.dart';

import 'Product.dart';

class Cart {
  final Product product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: demoCategories[0], numOfItem: 2),
  // Cart(product: demoCategories[1], numOfItem: 1),
  // Cart(product: demoCategories[3], numOfItem: 1),
];
