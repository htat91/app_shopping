// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

List<Products> productsFromJson(String str) => List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
    Products({
        required this.id,
        required this.title,
        required this.description,
        this.image,
        required this.price,
        required this.categoryId,
        this.category,
    });

    int id;
    String title;
    String description;
    String? image;
    double price;
    int categoryId;
    dynamic category;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        categoryId: json["categoryId"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "price": price,
        "categoryId": categoryId,
        "category": category,
    };
}
