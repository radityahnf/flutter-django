
import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
    Item({
        required this.title,
        required this.description,
        required this.imageLink,
        required this.favorite,
    });

    String? title;
    String? description;
    String? imageLink;
    bool? favorite;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        title: json["fields"]["title"],
        description: json["fields"]["description"],
        imageLink: json["fields"]["image_link"],
        favorite: json["fields"]["favorite"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "image_link": imageLink,
        "favorite": favorite,
    };
}
