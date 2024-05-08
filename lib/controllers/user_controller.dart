import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/models/user_model.dart';
import 'package:flutter/material.dart';

class UserController with ChangeNotifier {
  List<UserModel> users = [
    UserModel(username: 'Choso', email: 'choso@gmail.com.br', password: '1234')
  ];
  void addToCart(String userEmail, ProductModel product) {
    UserModel? user = users.firstWhere((u) => u.email == userEmail);
    if (user.email.isNotEmpty) {
      user.products.add(product);
    }
  }

  void addFavorite(String userEmail, ProductModel product) {
    UserModel? user = users.firstWhere((u) => u.email == userEmail);
    if (user.email.isNotEmpty) {
      if (!user.favorites.contains(product)) {
        user.favorites.add(product);
      }
    }
  }

  void removeFavorite(String userEmail, ProductModel product) {
    UserModel? user = users.firstWhere((u) => u.email == userEmail,);
    user.favorites.remove(product);
    notifyListeners(); // Notifica os ouvintes sobre a mudança nos favoritos
    }


  void addUser(String username, String email, String password) {
    users.add(UserModel(username: username, email: email, password: password));
    notifyListeners();
  }


  UserModel loginUser(String email, String password) {
    return users
        .firstWhere((user) => user.email == email && user.password == password);
  }
  Future<List<ProductModel>> favoriteProductsUser(index) async {
    return users[index].favorites;
  }

  
}
