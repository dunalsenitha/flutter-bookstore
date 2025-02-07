import 'package:flutter/material.dart';
import 'package:midterm/pages/home.dart';
import 'package:provider/provider.dart';
import '../cart_model.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<CartModel>(context).cartItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 142, 184, 203),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20), 
              child: Image.asset('assets/images/logo.png'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("H O M E"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart), // Cart Icon
              title: const Text("C A R T"),
              onTap: () {
                // Navigate to CartPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Your cart is empty!",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Image.asset(item['imageUrl']!, width: 50, height: 50),
                    title: Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("Rs. ${item['price']}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        Provider.of<CartModel>(context, listen: false).removeFromCart(index);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
