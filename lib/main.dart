import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/home/restaurant_list_provider.dart';
import 'package:restaurant_app/style/theme/restaurant_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => ApiService()),
        ChangeNotifierProvider(
          create: (context) =>
              RestaurantListProvider(context.read<ApiService>()),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      theme: RestaurantTheme.lightTheme,
      darkTheme: RestaurantTheme.darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
