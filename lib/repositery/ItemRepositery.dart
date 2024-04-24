import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testelkony/models/itemModel.dart';



class ItemRepository {
  Future<List<Item>> fetchItems() async {
    final response =
        await http.get(Uri.parse('https://66278e4bb625bf088c08c8e9.mockapi.io/items'));
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((room) => Item.fromJson(room)).toList();
    } else {
      throw Exception('Failed to load rooms');
    }
  }
}
