import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/detail/restaurant_detail_provider.dart';
import 'package:restaurant_app/static/restaurant_detail_result_state.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final String restaurantId;
  const RestaurantDetailScreen({Key? key, required this.restaurantId})
    : super(key: key);

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
      () => Provider.of<RestaurantDetailProvider>(
        context,
        listen: false,
      ).fetchRestaurantDetail(widget.restaurantId),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Restaurant Detail')),
      body: Consumer<RestaurantDetailProvider>(
        builder: (context, provider, child) {
          if (provider.resultState is RestaurantDetailLoadedState) {
            final restaurant =
                (provider.resultState as RestaurantDetailLoadedState).data;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 'restaurant_hero_${restaurant.id}',
                    child: Image.network(
                      'https://restaurant-api.dicoding.dev/images/medium/${restaurant.pictureId}',
                      fit: BoxFit.cover,
                      height: 250,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ],
              ),
            );
          } else if (provider.resultState is RestaurantDetailErrorState) {
            final error =
                (provider.resultState as RestaurantDetailErrorState).error;
            return Center(child: Text(error));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
