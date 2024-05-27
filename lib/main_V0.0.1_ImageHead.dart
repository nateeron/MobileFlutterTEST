import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView Example"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Handle search action
              },
            ),
            IconButton(
              icon: Icon(Icons.chat),
              onPressed: () {
                // Handle chat action
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Handle profile action
              },
            ),
          ],
        ),
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
          unselectedItemColor: Colors.brown[200],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  // Sample data for the lists
  final List<String> horizontalItems =
      List<String>.generate(30, (i) => "Horizontal $i");
  final List<String> verticalItems =
      List<String>.generate(100, (i) => "Vertical $i");
  final List<String> images = [
    'assets/test11.png',
    'assets/test22.png',
    'assets/test33.png',
  ];

  // Page controller for the PageView
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: <Widget>[
        Container(
          height: 200.0, // Adjust the height of the slideshow
          child: PageView.builder(
            controller: _controller,
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        SizedBox(height: 10.0),
        SmoothPageIndicator(
          controller: _controller,
          count: images.length,
          effect: WormEffect(
            offset: 0,
            dotHeight: 5.0,
            dotWidth: 10.0,
            spacing: 0,
            radius: 0,
            activeDotColor: Colors.brown,
          ),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Container(
            height:
                150.0, // Adjust the height of the container to fit three rows
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Three rows
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1,
                  ),
                  itemCount: horizontalItems.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return FloatingActionButton.small(
                      foregroundColor: colorScheme.primary,
                      backgroundColor: colorScheme.surface,
                      onPressed: () {
                        // Add your onPressed code here!
                      },
                      child: const Icon(Icons.edit_outlined),
                    );
                  },
                  shrinkWrap: true,
                ),
              ],
            ),
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
