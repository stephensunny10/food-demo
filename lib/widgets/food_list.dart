import 'package:flutter/material.dart';

class FoodItemList extends StatelessWidget {
  FoodItemList({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> foodItems = [
    {
      'name': 'Pizza',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZZ3B2U3LP5aoLqegISi0ONYWfa-emocGLq5h155D7yg&s',
      'price': 10.99,
    },
    {
      'name': 'Burger',
      'image': 'https://cdn-icons-png.flaticon.com/512/5787/5787016.png',
      'price': 8.99,
    },
    {
      'name': 'Pasta',
      'image': 'https://cdn-icons-png.flaticon.com/512/776/776458.png',
      'price': 12.99,
    },
    {
      'name': 'Salad',
      'image': 'https://cdn-icons-png.flaticon.com/512/2515/2515183.png',
      'price': 6.99,
    },
    {
      'name': 'Salad',
      'image': 'https://cdn-icons-png.flaticon.com/512/2515/2515183.png',
      'price': 6.99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodItems.length,
      itemBuilder: (context, index) {
        return FoodItem(
          name: foodItems[index]['name'],
          image: foodItems[index]['image'],
          price: foodItems[index]['price'],
        );
      },
    );
  }
}

class FoodItem extends StatelessWidget {
  final String name;
  final String image;
  final double price;

  const FoodItem({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      color: Colors.white, // Adding grey background color
      child: ListTile(
        leading: Image.network(
          image,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(
          name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '\$${price.toStringAsFixed(2)}',
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Handle item tap
        },
      ),
    );
  }
}