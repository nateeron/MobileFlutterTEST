import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Centered Top Menu'),
      ),
      body: Column(
        children: [
          // Padding to provide space from the top
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildMenuButton('Home', Icons.home),
                _buildMenuButton('Coin', Icons.monetization_on),
                _buildMenuButton('Messages', Icons.message),
                _buildMenuButton('Member', Icons.person),
                _buildMenuButton('Profile', Icons.account_circle),
              ],
            ),
          ),
          // Placeholder for the rest of the content
          Expanded(
            child: Center(
              child: Text('Content goes here'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton.icon(
        onPressed: () {
          // Add your onPressed code here!
        },
        icon: Icon(icon),
        label: Text(title),
      ),
    );
  }
}
