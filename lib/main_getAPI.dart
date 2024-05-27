import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

class Item {
  final int userId;
  final int id;
  final String title;
  final String body;

  Item(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
class Item2 {
  final int mainId;
  final String mainName;
  final String? error;

  Item2(
      {required this.mainId,
      required this.mainName,
      this.error});

  factory Item2.fromJson(Map<String, dynamic> json) {
    return Item2(
      mainId: json['mainId'],
      mainName: json['mainName'],
      error: json['error'],
    );
  }

 
}

class Item3 {
  final int id;
  final String title;
  final String subtitle;

  Item3(
      {required this.id,
      required this.title,
      required this.subtitle,
     });

  factory Item3.fromJson(Map<String, dynamic> json) {
    return Item3(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }
}

Future<List<Item3>> fetchItems() async {
  final url = 'http://10.88.88.132:8283/api/run';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((item) => Item3.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load items');
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<Item3>> futureItems;

  @override
  void initState() {
    super.initState();
    futureItems = fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
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
      body: FutureBuilder<List<Item3>>(
        future: futureItems,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.label),
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].subtitle),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Handle item tap
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
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
        currentIndex: 0,
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }
}
