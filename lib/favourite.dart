import 'package:flutter/material.dart';
import 'package:flutter_master/widgets/food_list.dart'; // Import your food list widget here

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Foods'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // You can add any header or other content here if needed
            const Text(
              'Your Favorite Foods',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FoodItemList(), // Replace FoodItemList with your favorite food list widget
            ),
          ],
        ),
      ),
    );
  }
}
