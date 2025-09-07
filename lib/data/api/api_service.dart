import 'dart:convert';

import 'package:restaurant_app/data/model/restaurant_detail_respone.dart';
import 'package:restaurant_app/data/model/restaurant_list_respone.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant_search_response.dart';

class ApiService {
  static const _baseUrl = "https://restaurant-api.dicoding.dev";

  Future<RestaurantListRespone> getRestaurantList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return RestaurantListRespone.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Restaurant List.');
    }
  }

  Future<RestaurantDetailRespone> getRestaurantDetail(int id) async {
    final response = await http.get(Uri.parse("$_baseUrl/detail/$id"));

    if (response.statusCode == 200) {
      return RestaurantDetailRespone.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Restaurant Detail.');
    }
  }

  Future<RestaurantSearchResponse> getRestaurantSearch(String query) async {
    final response = await http.get(Uri.parse("$_baseUrl/search?q=$query"));
    if (response.statusCode == 200) {
      return RestaurantSearchResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to Load Restaurant Search.');
    }
  }
}
