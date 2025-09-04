import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantListRespone {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  RestaurantListRespone({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestaurantListRespone.fromJson(Map<String, dynamic> json) {
    return RestaurantListRespone(
      error: json["error"],
      message: json["message"],
      count: json["count"],
      restaurants: json["restaurants"] != null
          ? List<Restaurant>.from(
              json["restaurants"]!.map((x) => Restaurant.fromJson(x)),
            )
          : <Restaurant>[],
    );
  }
}
