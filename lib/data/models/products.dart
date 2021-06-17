// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  Product({
    this.brand,
    this.details,
    this.idProducts,
    this.image,
    this.location,
    this.name,
    this.price,
    this.rentalType,
    this.type,
  });

  String brand;
  String details;
  int idProducts;
  String image;
  String location;
  String name;
  int price;
  RentalType rentalType;
  ProductType type;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        brand: json["brand"],
        details: json["details"],
        idProducts: json["id_products"],
        image: json["image"],
        location: json["location"],
        name: json["name"],
        price: json["price"],
        rentalType: getType(json["rental_type"]),
        type: getProductType(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "brand": brand,
        "details": details,
        "id_products": idProducts,
        "image": image,
        "location": location,
        "name": name,
        "price": price,
        "rental_type": getTypeStr(rentalType),
        "type": getProductTypeStr(type),
      };
}

RentalType getType(String typeStr) {
  return RentalType.values.firstWhere((e) => getTypeStr(e) == typeStr);
}

String getTypeStr(RentalType type) {
  return type.toString().split(".").last;
}

ProductType getProductType(String typeStr) {
  return ProductType.values.firstWhere((e) => getProductTypeStr(e) == typeStr);
}

String getProductTypeStr(ProductType type) {
  return type.toString().split(".").last;
}

enum ProductType { car, bike }
enum RentalType { monthly, weekly, daily }
