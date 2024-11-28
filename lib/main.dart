
import 'package:chennai_restaurant_project/provider/app_provider.dart';
import 'package:chennai_restaurant_project/provider/menu_provider.dart';
import 'package:chennai_restaurant_project/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStateProvider()),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Responsive Restaurant Homepage',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const Homepage(),
    );
  }
}
