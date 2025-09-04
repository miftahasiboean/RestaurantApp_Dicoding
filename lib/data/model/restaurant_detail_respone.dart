import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantDetailRespone {
  final bool error;
  final String message;
  final Restaurant restaurant;

  RestaurantDetailRespone({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory RestaurantDetailRespone.fromJson(Map<String, dynamic> json) {
    return RestaurantDetailRespone(
      error: json["error"],
      message: json["message"],
      restaurant: Restaurant.fromJson(json["restaurant"]),
    );
  }
}
