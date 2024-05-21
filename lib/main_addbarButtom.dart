import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  // List of widgets to show for each bottom navigation item
  final List<Widget> _pages = [
    HomePage(),
    CoinPage(),
    MessagesPage(),
    MemberPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.brown),
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
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
              icon: Icon(Icons.person),
              label: 'Member',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.brown[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  // Sample data for the lists
  final List<String> horizontalItems = List<String>.generate(10, (i) => "Horizontal $i");
  final List<String> verticalItems = List<String>.generate(100, (i) => "Vertical $i");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0, // Adjust the height of the horizontal list
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: horizontalItems.length,
            itemBuilder: (context, index) {
              return Container(
                width: 100.0, // Adjust the width of each item
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                color: Colors.brown[200],
                child: Center(
                  child: Text(horizontalItems[index]),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: verticalItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.label),
                title: Text(verticalItems[index]),
                subtitle: Text('Subtitle ${verticalItems[index]}'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Handle item tap if needed
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class CoinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Coin Page'),
    );
  }
}

class MessagesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Messages Page'),
    );
  }
}

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Member Page'),
    );
  }
}
