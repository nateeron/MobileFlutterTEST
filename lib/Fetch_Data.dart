// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import './Model_Class.dart';

// Future<List<Item>> fetchItemss() async {
//   final response = await http.get(Uri.parse('https://localhost:44330/api/run'));

//   if (response.statusCode == 200) {
//     List jsonResponse = json.decode(response.body);
//     return jsonResponse.map((item) => Item.fromJson(item)).toList();
//   } else {
//     throw Exception('Failed to load items');
//   }
// }

