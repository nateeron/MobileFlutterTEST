import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleThemeMode() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dark and Light Mode',
      themeMode: _themeMode,
      theme: ThemeData(
        primaryColor: Colors.blue, // Example primary color for light mode
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.red, // Example primary color for dark mode
        brightness: Brightness.dark,
      ),
      home: MyHomePage(
        toggleThemeMode: _toggleThemeMode,
        themeMode: _themeMode,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final VoidCallback toggleThemeMode;
  final ThemeMode themeMode;

  MyHomePage({required this.toggleThemeMode, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    // Log the primary color to verify it is correct
    final primaryColor = Theme.of(context).primaryColor;
    print('Primary Color: $primaryColor');

    return Scaffold(
      appBar: AppBar(
        title: Text('Dark and Light Mode Example'),
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
            ),
            onPressed: toggleThemeMode,
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Hello, Flutter!',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Coin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
