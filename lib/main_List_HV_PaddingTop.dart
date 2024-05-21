import 'package:flutter/material.dart';



void main() {
  
  
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.brown),
    );
  }
}

class HomePage extends StatelessWidget {
  // Sample data for the lists
  final List<String> horizontalItems = List<String>.generate(10, (i) => "Horizontal $i");
  final List<String> verticalItems = List<String>.generate(100, (i) => "Vertical $i");
 // Sample data for the slideshow
  final List<String> images = [
    'assets/test11.png',
    'assets/test22.png',
    'assets/test33.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Example"),
      ),
      body: Column(
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
            child:Container(
              margin: EdgeInsets.only(top: 1.0),
              child:  ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
