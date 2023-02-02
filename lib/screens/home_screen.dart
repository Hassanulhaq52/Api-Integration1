import 'package:flutter/material.dart';
import 'package:simple_api_integration/services/api_services.dart';
import 'package:simple_api_integration/widgets/navigation_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigationButton(
              onpressed: () {
                Navigator.pushNamed(
                  context,
                  'bio_screen',
                );
              },
              title: 'Go to Bio Screen',
            ),
            const SizedBox(
              height: 20.0,
            ),
            NavigationButton(
              onpressed: () {
                Navigator.pushNamed(
                  context,
                  'comments_screen',
                );
              },
              title: 'Go to Comments Screen',
            ),
            const SizedBox(
              height: 20.0,
            ),
            NavigationButton(
              onpressed: () {
                Navigator.pushNamed(
                  context,
                  'university_info_screen',
                );
              },
              title: 'Go to University Info Screen',
            ),
            const SizedBox(
              height: 20.0,
            ),
            NavigationButton(
              onpressed: () {
                Navigator.pushNamed(
                  context,
                  'user_info_screen',
                );
              },
              title: 'Go to User Info Screen',
            ),
            const SizedBox(
              height: 20.0,
            ),
            NavigationButton(
              onpressed: () {
                Navigator.pushNamed(
                  context,
                  'players_screen',
                );
              },
              title: 'Players Screen',
            ),
          ],
        ),
      ),
    );
  }
}
