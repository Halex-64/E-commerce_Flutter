import 'package:ecommerce_flutter/controllers/user_controller.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/screens/cart.dart';
import 'package:ecommerce_flutter/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              icon: const Icon(Icons.home)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: FutureBuilder<List<ProductModel>>(
        future: userProvider.favoriteProductsUser(0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List<ProductModel>? myFavorites = snapshot.data;
            if (myFavorites!.isEmpty) {
              return const Center(child: Text('Sem dados'));
            }
            return ListView.builder(
                itemCount: myFavorites.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(myFavorites[index].name),
                    subtitle: Text(myFavorites[index].description),
                    trailing: IconButton(
                        onPressed: () {
                          userProvider.removeFavorite(
                              "choso@gmail.com.br", myFavorites[index]);
                        },
                        icon: const Icon(Icons.remove)),
                  );
                });
          }
          return const Center(child: Text('Nao possui'));
        },
      ),
    );
  }
}
