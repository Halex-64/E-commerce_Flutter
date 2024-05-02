import 'package:ecommerce_flutter/controllers/product_controller.dart';
import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/screens/cart.dart';
import 'package:ecommerce_flutter/screens/favorites.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Favorites()));
              },
              icon: const Icon(Icons.favorite)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
              icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Consumer<ProductController>(builder: (context, product, child) {
        List<ProductModel> products = product.products;
        return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Text(products[index].name);
            });
      }),
    );
  }
}
