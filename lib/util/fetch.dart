import 'package:http/http.dart' as http;
import 'package:ristekmob/main.dart';
import 'dart:convert';

import 'package:ristekmob/util/model.dart';

Future<List<Item>> fetchItem() async {
  var url = Uri.parse(
      'https://project-desktop-production.up.railway.app/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));
  
  
  List<Item> listItem = [];
    for (var d in data) {

      
      print(d);
      if (d != null) {
        listItem.add(Item.fromJson(d));
      }
     
    }
  
  

  return listItem;
}