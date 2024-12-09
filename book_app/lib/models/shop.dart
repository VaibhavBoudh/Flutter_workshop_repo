import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:book_app/models/product.dart';

class Shop extends ChangeNotifier {
  // List of products fetched from the API
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      price: 99.99,
      description: "description",
      imagePath: 'assets/book_1.jpg',
    ),
    Product(
      name: "Product 2",
      price: 99.99,
      description: "description",
      // imagePath: imagePath
      imagePath: 'assets/book_2.jpeg',
    ),
    Product(
      name: "Product 3",
      price: 99.99,
      description: "description",
      // imagePath: imagePath
      imagePath: 'assets/book_3.jpeg',
    ),
    Product(
      name: "Product 4",
      price: 99.99,
      description: "description",
      // imagePath: imagePath
      imagePath: 'assets/book_4.jpeg',
    ),
  ];

  // User's cart
  final List<Product> _userCart = [];

  // Fetch products from the API and populate the _shop list

  // Get the list of products
  List<Product> get shop => _shop;

  // Get the user's cart
  List<Product> get userCart => _userCart;

  // Add item to cart
  void addItemToCart(Product product) {
    _userCart.add(product);
    notifyListeners();
  }

  // Delete item from cart
  void removeItemFromCart(Product product) {
    _userCart.remove(product);
    notifyListeners();
  }
}
