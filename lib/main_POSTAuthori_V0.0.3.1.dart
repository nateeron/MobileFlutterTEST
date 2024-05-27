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

Future<List<Item2>> fetchItems() async {
  const token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ1c2VydGVzdDEiLCJyb2xlIjoiMCIsImp0aSI6IjkwMGJkMjcwLTExNTItNGE1ZS04ZWQyLTc3YWUxNjdmZmMyYiIsImV4cCI6NDIyNzc1MTU5OSwiaXNzIjoiY2F5b3NoaSIsImF1ZCI6InlveW8ifQ.7xibqtt4suyxoytQahiWhXnEWbDDiA_gG0NpCwmr7mU';
  //const URL = 'https://jsonplaceholder.typicode.com/posts';
  const URL = 'http://10.88.88.200:511/GetMainSubject';
  //var response = await http.post(URL, headers:headers, body:data);
  final response = await http.post(Uri.parse(URL),headers: {
    'Authorization': 'Bearer $token',
  },);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((item) => Item2.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load items');
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<Item2>> futureItems;

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
      body: FutureBuilder<List<Item2>>(
        future: futureItems,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.label),
                  title: Text(snapshot.data![index].mainName),
                  subtitle: Text(snapshot.data![index].mainName),
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
