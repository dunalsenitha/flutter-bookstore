import 'package:flutter/material.dart';

import 'package:midterm/pages/CartPage.dart'; 
import 'package:midterm/widget/bookCard.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Book store ")),
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
      body: ListView(
        children: const [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BookCard(
                imageUrl: 'assets/images/MadolDoova.jpg',
                title: 'Madolduwa',
                author: 'Martin Wickramasinghe',
                price: '1,000',
              ),
              BookCard(
                imageUrl: 'assets/images/amba_yaluwo.jpg',
                title: 'Amda Yaluwo',
                author: 'T. B. Ilangaratne',
                price: '1,100',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BookCard(
                imageUrl: 'assets/images/gamperaliya.jpg',
                title: 'Gamperaliya',
                author: 'Martin Wickramasinghe',
                price: '1,500',
              ),
              BookCard(
                imageUrl: 'assets/images/guru_githaya.jpg',
                title: 'Guru Geethaya',
                author: 'Dedigama V. Rodrigo',
                price: '1,000',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BookCard(
                imageUrl: 'assets/images/napoleon.jpg',
                title: 'Napoleon',
                author: 'Andrew Roberts',
                price: '2,000',
              ),
              BookCard(
                imageUrl: 'assets/images/the-old-man-and-the-sea.jpg',
                title: 'Old Man And The Sea',
                author: 'Ernest Hemingway',
                price: '2,300',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
