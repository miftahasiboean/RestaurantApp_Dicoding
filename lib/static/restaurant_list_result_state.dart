import 'package:restaurant_app/data/model/restaurant.dart';

sealed class RestaurantListResultState {}

class RestaurantlistNoneState extends RestaurantListResultState {}

class RestaurantlistLoadingeState extends RestaurantListResultState {}

class RestaurantlistErrorState extends RestaurantListResultState {
  final String error;
  RestaurantlistErrorState(this.error);
}

class RestaurantlistLoadedState extends RestaurantListResultState {
  final List<Restaurant> data;

  RestaurantlistLoadedState(this.data);
}
