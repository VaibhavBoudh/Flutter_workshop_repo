import 'package:book_app/components/my_drawer.dart';
import 'package:book_app/components/my_product_tile.dart';
import 'package:book_app/models/product.dart';
import 'package:book_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopBag extends StatelessWidget {
  const ShopBag({super.key});

  @override
  Widget build(BuildContext context) {
    // access the final products
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Shop Bag"),
          actions: [
            // cart button
            IconButton(
                padding: const EdgeInsets.only(right: 25.0),
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: const Icon(Icons.shopping_cart_checkout))
          ],
        ),
        drawer: const MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: ListView(
          children: [
            //shop subtitle
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                "Pick your fav book ",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),

            // Product tiles
            SizedBox(
              height: 550,
              child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  //get individula product
                  final product = products[index];

                  // return as product tile
                  return MyProductTile(product: product);
                },
              ),
            ),
          ],
        ));
  }
}
