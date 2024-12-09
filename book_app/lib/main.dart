import 'package:book_app/models/shop.dart';
import 'package:book_app/pages/cart_page.dart';
import 'package:book_app/pages/intro_pages.dart';
import 'package:book_app/pages/shop_page.dart';
import 'package:book_app/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:book_app/consts.dart';
import 'package:book_app/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  Gemini.init(apiKey: GEMINI_API_KEY);
  runApp(ChangeNotifierProvider(
    create: (context) => Shop(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Gemini',
      home: const IntroPage(),
      theme: lightmode,
      routes: {
        'intro_pages': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopBag(),
        '/chat_page': (context) => const HomePage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
