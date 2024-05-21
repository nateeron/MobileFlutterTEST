import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _searchController = TextEditingController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white70),
          ),
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Handle profile action
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: _buildSliverChildBuilderDelegate(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Coin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Member',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  SliverChildBuilderDelegate _buildSliverChildBuilderDelegate(int index) {
    switch (index) {
      case 0:
        return SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Item $index'),
              subtitle: Text('Subtitle $index'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Handle item tap
              },
            );
          },
          childCount: 100, // Number of items in the list
        );
      case 1:
        return SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Coin Item $index'),
              subtitle: Text('Subtitle $index'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Handle item tap
              },
            );
          },
          childCount: 100, // Number of items in the list
        );
      case 2:
        return SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.message),
              title: Text('Message Item $index'),
              subtitle: Text('Subtitle $index'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Handle item tap
              },
            );
          },
          childCount: 100, // Number of items in the list
        );
      case 3:
        return SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.people),
              title: Text('Member Item $index'),
              subtitle: Text('Subtitle $index'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Handle item tap
              },
            );
          },
          childCount: 100, // Number of items in the list
        );
      default:
        return SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.error),
              title: Text('Unknown Item $index'),
              subtitle: Text('Subtitle $index'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Handle item tap
              },
            );
          },
          childCount: 1,
        );
    }
  }
}
