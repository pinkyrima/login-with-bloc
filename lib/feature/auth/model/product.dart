import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
     required this.name,
     required this.price,
     required this.image,
  });

  final String name;
  final int price;
  final String image;

  Product copyWith({
     String? name,
     int? price,
     String? image,
  }) =>
      Product(
        name: name ?? this.name,
        price: price ?? this.price,
        image: image ?? this.image,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    price: json["price"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "price": price,
    "image": image,
  };
}