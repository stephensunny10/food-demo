import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_master/favourite.dart';
import 'package:flutter_master/profile.dart';
import 'package:flutter_master/widgets/category_list.dart';
import 'package:flutter_master/widgets/food_list.dart';
import 'package:flutter_master/widgets/image_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();

  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomePage(),
    // Add other screens for the bottom navigation here
    Placeholder(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            SearchBar(
              searchController: _searchController,
            ),
            SizedBox(height: 20),
            ImageSlider(),
            const SizedBox(height: 25),
            Container(
                height: 90,
                width: double.infinity, // Set width to maximum available width
                child: CategoryItemList()),
            const SizedBox(height: 10),
            const Row(
              // Wrap the text with a Row widget
              children: [
                Text(
                  'Trending items',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                Spacer(), // Add a spacer to push the "View All" text to the right
                Text(
                  'View All',
                  style: TextStyle(
                    fontSize: 16, // Adjust the font size as needed
                    color: Colors.blue, // Customize the color if necessary
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(child: FoodItemList())
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
         onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritePage()),
            );
          } else if (index == 2) {
            // Navigate to ProfilePage when Profile tab is clicked
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController searchController;

  const SearchBar({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        controller: searchController,
        decoration: const InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          icon: Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }
}

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Booking Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
