import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/screen/home/restaurant_card.dart';
import 'package:restaurant_app/static/restaurant_list_result_state.dart';

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreen();
}

class _RestaurantListScreen extends State<RestaurantListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<RestaurantListProvider>(
        context,
        listen: false,
      ).fetchRestaurantList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RestaurantListProvider>(
        builder: (context, provider, child) {
          if (provider.resultState is RestaurantlistLoadingeState) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.resultState is RestaurantlistLoadedState) {
            final restaurants =
                (provider.resultState as RestaurantlistLoadedState).data;
            return ListView(
              children: restaurants
                  .map((restaurant) => RestaurantCard(restaurant: restaurant))
                  .toList(),
            );
          } else if (provider.resultState is RestaurantlistErrorState) {
            final error =
                (provider.resultState as RestaurantlistErrorState).error;
            return Center(child: Text(error));
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    );
  }
}
