import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/static/restaurant_search_result.dart';

class RestaurantSearchProvider extends ChangeNotifier {
  final ApiService _apiService;
  RestaurantSearchProvider(this._apiService);

  RestaurantSearchResult _searchResult = RestaurantSearchNoneState();
  RestaurantSearchResult get searchResult => _searchResult;

  Future<void> getRestaurantSearch(String query) async {
    if (query.isEmpty) {
      _searchResult = RestaurantSearchNoneState();
      notifyListeners();
      return;
    }

    try {
      _searchResult = RestaurantSearchLoadingState();
      notifyListeners();
      final result = await _apiService.getRestaurantSearch(query);
      _searchResult = RestaurantSearchLoadedState(data: result.restaurants);
      notifyListeners();
    } on SocketException {
      _searchResult = RestaurantSearchErrorState(
        error: 'Tidak Ada Koneksi Internet.',
      );
      notifyListeners();
    } catch (e) {
      _searchResult = RestaurantSearchErrorState(
        error: 'Gagal Mencari Restaurant: ${e.toString()}',
      );
      notifyListeners();
    }
  }
}
