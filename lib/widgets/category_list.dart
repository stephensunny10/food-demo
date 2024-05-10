import 'package:flutter/material.dart';

class CategoryItemList extends StatelessWidget {
  CategoryItemList({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> categories = [
    {
      'name': 'Category 1',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQltQPyA_6CjhV7cRaPhdq29tN6Nk2lRo2IiGhI2IYZFA&s',
    },
    {
      'name': 'Category 2',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQltQPyA_6CjhV7cRaPhdq29tN6Nk2lRo2IiGhI2IYZFA&s',
    },
    {
      'name': 'Category 3',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQltQPyA_6CjhV7cRaPhdq29tN6Nk2lRo2IiGhI2IYZFA&s',
    },
    {
      'name': 'Category 4',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQltQPyA_6CjhV7cRaPhdq29tN6Nk2lRo2IiGhI2IYZFA&s',
    },
    {
      'name': 'Category 5',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQltQPyA_6CjhV7cRaPhdq29tN6Nk2lRo2IiGhI2IYZFA&s',
    },
    {
      'name': 'Category 6',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQltQPyA_6CjhV7cRaPhdq29tN6Nk2lRo2IiGhI2IYZFA&s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      // shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryItem(
          name: categories[index]['name'],
          imageUrl: categories[index]['image'],
        );
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CategoryItem({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
