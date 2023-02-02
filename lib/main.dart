import 'package:flutter/material.dart';
import 'package:simple_api_integration/screens/comments_screen.dart';
import 'package:simple_api_integration/screens/test_api_screen.dart';
import 'package:simple_api_integration/screens/university_info_screen.dart';
import 'package:simple_api_integration/screens/user_info_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Api Integrations',
      initialRoute: 'test_api_screen',
      routes: {
        'test_api_screen': (context) => const TestApiScreen(),
        'comments_screen': (context) => const CommentsScreen(),
        'university_info_screen': (context) => const UniversityInfoScreen(),
        'user_info_screen': (context) => const UserInfoScreen(),

      },
    );
  }
}
