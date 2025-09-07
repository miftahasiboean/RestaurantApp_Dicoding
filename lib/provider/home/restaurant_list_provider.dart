import 'package:flutter/widgets.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/static/restaurant_list_result_state.dart';

class RestaurantListProvider extends ChangeNotifier {
  final ApiService _apiService;

  RestaurantListProvider(this._apiService);

  RestaurantListResultState _resultState = RestaurantlistNoneState();
  RestaurantListResultState get resultState => _resultState;

  Future<void> fetchRestaurantList() async {
    try {
      _resultState = RestaurantlistLoadingeState();
      notifyListeners();

      final result = await _apiService.getRestaurantList();

      if (result.error) {
        _resultState = RestaurantlistErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = RestaurantlistLoadedState(result.restaurants);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = RestaurantlistErrorState(e.toString());
      notifyListeners();
    }
  }
}
