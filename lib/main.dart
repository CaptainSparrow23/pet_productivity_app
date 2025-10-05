import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'utils/app_colors.dart';
import 'pages/settings_page.dart';
import 'pages/pets_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.tealBlue),
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/settings': (context) => const SettingsPage(),
        '/pets': (context) => const PetsPage(),
      },
    );
  }
}
