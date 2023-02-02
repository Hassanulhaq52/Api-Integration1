import 'package:flutter/material.dart';
import 'package:simple_api_integration/screens/comments_screen.dart';
import 'package:simple_api_integration/screens/bio_screen.dart';
import 'package:simple_api_integration/screens/players_screen.dart';
import 'package:simple_api_integration/screens/university_info_screen.dart';
import 'package:simple_api_integration/screens/user_info_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Api Integrations',
      initialRoute: 'home_screen',
      routes: {
        'bio_screen': (context) => const BioScreen(),
        'comments_screen': (context) => const CommentsScreen(),
        'university_info_screen': (context) => const UniversityInfoScreen(),
        'user_info_screen': (context) => const UserInfoScreen(),
        'home_screen': (context) => const HomeScreen(),
        'players_screen': (context) => const PlayersScreen(),

      },
    );
  }
}
