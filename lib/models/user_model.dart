import 'package:ecommerce_flutter/models/product_model.dart';

class UserModel {
  String username;
  String email;
  String password;
  List<ProductModel> products = [];
  List<ProductModel> favorites = [];

  UserModel({required this.username, required this.email, required this.password});

  void addProduct(ProductModel product) {
    products.add(product);
  }

  void addFavorite(ProductModel product) {
    if (!favorites.contains(product)) {
      favorites.add(product);
    }
  }

  void removeProduct(ProductModel product) {
    products.remove(product);
  }
  
  void removeFavorite(ProductModel product) {
    if (favorites.contains(product)) {
      favorites.remove(product);
    }
  }
}
