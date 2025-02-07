import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:midterm/pages/CartPage.dart';
import '../cart_model.dart';

class BookDetails extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String price;

  const BookDetails({
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.price,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to CartPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Center(
                child: Image.asset(
                  imageUrl,
                  height: 350,
                  width: 240,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('By $author', style: TextStyle(fontSize: 16, color: Colors.grey[600])),
            const SizedBox(height: 10),
            Text('Rs. $price', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add item to the global cart using Provider
                Provider.of<CartModel>(context, listen: false).addToCart({
                  'imageUrl': imageUrl,
                  'title': title,
                  'price': price,
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$title added to cart!")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text("Add to Cart", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
