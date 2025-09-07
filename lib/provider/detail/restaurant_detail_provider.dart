import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/static/restaurant_detail_result_state.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  final ApiService _apiService;
  RestaurantDetailProvider(this._apiService);
  RestaurantDetailResultState _resultState = RestaurantDetailNoneState();
  RestaurantDetailResultState get resultState => _resultState;

  Future<void> fetchRestaurantDetail(int id) async {
    try {
      _resultState = RestaurantDetailLoadingeState();
      notifyListeners();

      final result = await _apiService.getRestaurantDetail(id);

      if (result.error) {
        _resultState = RestaurantDetailErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = RestaurantDetailLoadedState(result.restaurant);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = RestaurantDetailErrorState(e.toString());
      notifyListeners();
    }
  }
}
