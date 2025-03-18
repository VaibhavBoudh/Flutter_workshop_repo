import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:book_app/models/product.dart';

class Seeds {
  static final List<Product> books = [
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
      imagePath: 'assets/book_6.jpg',
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
      imagePath: 'assets/book_8.jpg',
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
      imagePath: 'assets/book_10.jpg',
    ),
    Product(
      name: "Start with Why",
      price: 269.99,
      description: "Simon Sinek's book on leadership and purpose.",
      imagePath: 'assets/book_11.jpg',
    ),
    Product(
      name: "The Lean Startup",
      price: 349.99,
      description: "Eric Ries on how to build a successful startup.",
      imagePath: 'assets/book_12.jpg',
    ),
    Product(
      name: "Zero to One",
      price: 299.99,
      description: "Peter Thiel’s guide on startups and innovation.",
      imagePath: 'assets/book_13.jpg',
    ),
    Product(
      name: "The Art of War",
      price: 179.99,
      description: "Sun Tzu’s ancient military strategy book.",
      imagePath: 'assets/book_14.jpg',
    ),
    Product(
      name: "Grit",
      price: 239.99,
      description: "Angela Duckworth’s research on passion and perseverance.",
      imagePath: 'assets/book_15.jpg',
    ),
    Product(
      name: "Man’s Search for Meaning",
      price: 199.99,
      description: "Viktor Frankl’s memoir on finding meaning in life.",
      imagePath: 'assets/book_16.jpg',
    ),
  ];

  static Future<void> seedBooksToFirestore() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    final CollectionReference booksCollection = firestore.collection('books');

    // Ensure the collection exists before adding documents
    await booksCollection.doc('init').set({'status': 'initialized'});

    for (var book in books) {
      await booksCollection.add({
        'name': book.name,
        'price': book.price,
        'description': book.description,
        'imagePath': book.imagePath,
      });
    }
  }
}
