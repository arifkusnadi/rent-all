// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

List<Book> bookFromJson(String str) =>
    List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));

String bookToJson(List<Book> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Book {
  Book({
    this.brand,
    this.date,
    this.details,
    this.idBooking,
    this.idProduct,
    this.idProducts,
    this.idUser,
    this.image,
    this.location,
    this.name,
    this.notes,
    this.paymentType,
    this.price,
    this.rentEnd,
    this.rentStart,
    this.rentalType,
    this.totalFee,
    this.type,
  });

  String brand;
  DateTime date;
  String details;
  int idBooking;
  int idProduct;
  int idProducts;
  int idUser;
  String image;
  String location;
  String name;
  String notes;
  String paymentType;
  int price;
  DateTime rentEnd;
  DateTime rentStart;
  String rentalType;
  String totalFee;
  String type;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        brand: json["brand"],
        date: DateTime.parse(json["date"]),
        details: json["details"],
        idBooking: json["id_booking"],
        idProduct: json["id_product"],
        idProducts: json["id_products"],
        idUser: json["id_user"],
        image: json["image"],
        location: json["location"],
        name: json["name"],
        notes: json["notes"],
        paymentType: json["payment_type"],
        price: json["price"],
        rentEnd: DateTime.parse(json["rent_end"]),
        rentStart: DateTime.parse(json["rent_start"]),
        rentalType: json["rental_type"],
        totalFee: json["total_fee"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "brand": brand,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "details": details,
        "id_booking": idBooking,
        "id_product": idProduct,
        "id_products": idProducts,
        "id_user": idUser,
        "image": image,
        "location": location,
        "name": name,
        "notes": notes,
        "payment_type": paymentType,
        "price": price,
        "rent_end":
            "${rentEnd.year.toString().padLeft(4, '0')}-${rentEnd.month.toString().padLeft(2, '0')}-${rentEnd.day.toString().padLeft(2, '0')}",
        "rent_start":
            "${rentStart.year.toString().padLeft(4, '0')}-${rentStart.month.toString().padLeft(2, '0')}-${rentStart.day.toString().padLeft(2, '0')}",
        "rental_type": rentalType,
        "total_fee": totalFee,
        "type": type,
      };
}
