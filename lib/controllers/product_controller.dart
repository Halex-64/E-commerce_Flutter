import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductController with ChangeNotifier {
  final List<ProductModel> products = [
    ProductModel(name: 'Macbook', price: 10000.00, description: 'M3'),
    ProductModel(name: 'Smartphone', price: 7000.00, description: 'Iphone 15'),
    ProductModel(name: 'Som', price: 550.00, description: 'JBL'),
  ];
}
