import 'package:restaurant_app/data/model/restaurant.dart';

class RestaurantListRespone {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurant;

  RestaurantListRespone({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurant,
  });

  factory RestaurantListRespone.fromJson(Map<String, dynamic> json) {
    return RestaurantListRespone(
      error: json["error"],
      message: json["message"],
      count: json["count"],
      restaurant: json["restaurant"] != null
          ? List<Restaurant>.from(
              json["restaurant"]!.map((x) => Restaurant.fromJson(x)),
            )
          : <Restaurant>[],
    );
  }
}
