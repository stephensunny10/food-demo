import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/user.png'), // Replace with your profile image
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'John Doe', // Replace with the user's name
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            const Text(
              'john.doe@example.com', // Replace with the user's email
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('Email'),
              subtitle: const Text('john.doe@example.com'),
              onTap: () {
                // Add onTap logic for editing email
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Contact'),
              subtitle: const Text('+1234567890'),
              onTap: () {
                // Add onTap logic for editing contact
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profile'),
              onTap: () {
                // Add onTap logic for editing profile
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Change Password'),
              onTap: () {
                // Add onTap logic for changing password
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('My Bookings'),
              onTap: () {
                // Add onTap logic for navigating to bookings
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Add onTap logic for logout
                Navigator.pop(context); // Navigate back to previous screen
              },
            ),
          ],
        ),
      ),
    );
  }
}
