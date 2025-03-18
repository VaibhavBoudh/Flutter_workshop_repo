import 'package:flutter/material.dart';
import 'package:book_app/models/product.dart';

class Shop extends ChangeNotifier {
  // List of products fetched from the API
  final List<Product> _shop = [
    Product(
      name: "The Alchemist",
      price: 199.99,
      description: "A novel by Paulo Coelho about following one's dreams.",
      imagePath: 'assets/book_1.jpg',
    ),
    Product(
      name: "Atomic Habits",
      price: 249.99,
      description: "A book by James Clear on building good habits.",
      imagePath: 'assets/book_2.jpeg',
    ),
    Product(
      name: "The Psychology of Money",
      price: 299.99,
      description: "Timeless lessons on wealth and happiness by Morgan Housel.",
      imagePath: 'assets/book_3.jpeg',
    ),
    Product(
      name: "Deep Work",
      price: 279.99,
      description: "A book by Cal Newport on focus and productivity.",
      imagePath: 'assets/book_4.jpeg',
    ),
    Product(
      name: "Sapiens: A Brief History of Humankind",
      price: 399.99,
      description: "Yuval Noah Harari explores the history of humankind.",
      imagePath: 'assets/book_5.jpg',
    ),
    Product(
      name: "Rich Dad Poor Dad",
      price: 199.99,
      description: "A personal finance book by Robert Kiyosaki.",
      imagePath: 'assets/book_6.jpeg',
    ),
    Product(
      name: "The 5 AM Club",
      price: 149.99,
      description: "Robin Sharma's guide to waking up early for success.",
      imagePath: 'assets/book_7.jpg',
    ),
    Product(
      name: "Ikigai",
      price: 199.99,
      description: "The Japanese secret to a long and happy life.",
      imagePath: 'assets/book_8.jpeg',
    ),
    Product(
      name: "The Subtle Art of Not Giving a F*ck",
      price: 249.99,
      description: "A self-help book by Mark Manson.",
      imagePath: 'assets/book_9.jpg',
    ),
    Product(
      name: "Think and Grow Rich",
      price: 299.99,
      description: "A classic self-improvement book by Napoleon Hill.",
      imagePath: 'assets/book_10.jpeg',
    ),
  ];

  // User's cart
  final List<Product> _userCart = [];

  // Get the list of products
  List<Product> get shop => _shop;

  // Get the user's cart
  List<Product> get userCart => _userCart;

  // Add item to cart
  void addItemToCart(Product product) {
    _userCart.add(product);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Product product) {
    _userCart.remove(product);
    notifyListeners();
  }
}
