import 'package:restaurant_app/data/model/restaurant.dart';

sealed class RestaurantSearchResult {}

final class RestaurantSearchNoneState extends RestaurantSearchResult {}

final class RestaurantSearchLoadingState extends RestaurantSearchResult {}

final class RestaurantSearchErrorState extends RestaurantSearchResult {
  final String error;
  RestaurantSearchErrorState({required this.error});
}

final class RestaurantSearchLoadedState extends RestaurantSearchResult {
  final List<Restaurant> data;
  RestaurantSearchLoadedState({required this.data});
}
