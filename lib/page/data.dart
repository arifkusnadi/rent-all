import 'package:flutter/material.dart';

class NavigationItem {

  IconData iconData;

  NavigationItem(this.iconData);

}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem(Icons.home),
    NavigationItem(Icons.calendar_today),
    NavigationItem(Icons.notifications),
    NavigationItem(Icons.person),
  ];
}

class Car {

  String brand;
  String model;
  double price;
  String condition;
  List<String> images;

  Car(this.brand, this.model, this.price, this.condition, this.images);

}

List<Car> getCarList(){
  return <Car>[
    Car(
      "Land Rover",
      "Discovery",
      380,
      "Daily",
      [
        "assets/images/land_rover_0.png",
        "assets/images/land_rover_1.png",
        "assets/images/land_rover_2.png",
      ],
    ),
    Car(
      "Alfa Romeo",
      "C4",
      350,
      "Days",
      [
        "assets/images/alfa_romeo_c4_0.png",
      ],
    ),
    Car(
      "Nissan",
      "GTR",
      300,
      "Daily",
      [
        "assets/images/nissan_gtr_0.png",
        "assets/images/nissan_gtr_1.png",
        "assets/images/nissan_gtr_2.png",
        "assets/images/nissan_gtr_3.png",
      ],
    ),
    Car(
      "Acura",
      "MDX 2020",
      2200,
      "Monthly",
      [
        "assets/images/acura_0.png",
        "assets/images/acura_1.png",
        "assets/images/acura_2.png",
      ],
    ),
    Car(
      "Chevrolet",
      "Camaro",
      550,
      "Weekly",
      [
        "assets/images/camaro_0.png",
        "assets/images/camaro_1.png",
        "assets/images/camaro_2.png",
      ],
    ),
    Car(
      "Ferrari",
      "Spider 488",
      720,
      "Weekly",
      [
        "assets/images/ferrari_spider_488_0.png",
        "assets/images/ferrari_spider_488_1.png",
        "assets/images/ferrari_spider_488_2.png",
        "assets/images/ferrari_spider_488_3.png",
        "assets/images/ferrari_spider_488_4.png",
      ],
    ),
    Car(
      "Ford",
      "Focus",
      600,
      "Weekly",
      [
        "assets/images/ford_0.png",
        "assets/images/ford_1.png",
      ],
    ),
    Car(
      "Fiat",
      "500x",
      950,
      "Weekly",
      [
        "assets/images/fiat_0.png",
        "assets/images/fiat_1.png",
      ],
    ),
    Car(
      "Honda",
      "Civic",
      900,
      "Daily",
      [
        "assets/images/honda_0.png",
      ],
    ),
    Car(
      "Citroen",
      "Picasso",
      1200,
      "Monthly",
      [
        "assets/images/citroen_0.png",
        "assets/images/citroen_1.png",
        "assets/images/citroen_2.png",
      ],
    ),
  ];
}

class Dealer {

  String name;
  int offers;
  String image;


  Dealer(this.name, this.offers, this.image);

}

List<Dealer> getDealerList(){
  return <Dealer>[
    Dealer(
      "Hertz",
      174,
      "assets/images/hertz.png",
    ),
    Dealer(
      "Avis",
      126,
      "assets/images/avis.png",
    ),
    Dealer(
      "Tesla",
      89,
      "assets/images/tesla.jpg",
    ),
  ];
}

class Filter {

  String name;

  Filter(this.name);

}

List<Filter> getFilterList(){
  return <Filter>[
    Filter("Best Match"),
    Filter("Highest Price"),
    Filter("Lowest Price"),
  ];
}