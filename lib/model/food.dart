import 'package:flutter/foundation.dart';

class Food {
  final String id;
  final String title;
  final double price;
  final String imageUrl;

  const Food({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.imageUrl,
  });
}

final foods = [
  Food(
    id: "1",
    title: "Cock Leg piece",
    price: 260.50,
    imageUrl: "https://www.julieseatsandtreats.com/wp-content/uploads/2020/07/Baked-Chicken-Legs-7-of-7-500x375.jpg",
  ),
  Food(
    id: "2",
    title: "Meat Roll",
    price: 150.00,
    imageUrl: "https://img.buzzfeed.com/thumbnailer-prod-us-east-1/b16bce9d6aa547b299568a41a5ff1f52/BFV21009_Bacon_Wrapped_Meat_Roll_FB1080SQ.jpg",
  ),
  Food(
    id: "3",
    title: "Full Hen",
    price: 400.50,
    imageUrl:
        "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/11/23/0/FN_perfect-chicken-014_s4x3.jpg.rend.hgtvcom.826.620.suffix/1384540895467.jpeg",
  ),
  Food(
    id: "4",
    title: "Burger",
    price: 220.50,
    imageUrl:
        "https://www.thespruceeats.com/thmb/l4w6PvMqsz1EjueCAh_foPmYafM=/3456x3456/smart/filters:no_upscale()/garlic-burger-patties-333503-hero-01-e4df660ff27b4e5194fdff6d703a4f83.jpg",
  ),
];
