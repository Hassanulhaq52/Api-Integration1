import 'package:flutter/material.dart';
import 'package:simple_api_integration/screens/bio_screen.dart';
import 'package:simple_api_integration/screens/comments_screen.dart';
import 'package:simple_api_integration/screens/date_picker.dart';
import 'package:simple_api_integration/screens/players_screen.dart';
import 'package:simple_api_integration/screens/products_screen.dart';
import 'package:simple_api_integration/screens/results_info_screen.dart';
import 'package:simple_api_integration/screens/university_info_screen.dart';
import 'package:simple_api_integration/screens/user_info_screen.dart';
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
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavigationButton(
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BioScreen(),
                  ),
                );
              },
              title: 'Go to Bio Screen',
            ),
            const SizedBox(
              height: 20.0,
            ),
            NavigationButton(
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CommentsScreen(),
                  ),
                );
              },
              title: 'Go to Comments Screen',
            ),
            const SizedBox(
              height: 20.0,
            ),
            NavigationButton(
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UniversityInfoScreen(),
                  ),
                );
              },
              title: 'Go to University Info Screen',
            ),
            const SizedBox(
              height: 20.0,
            ),
            NavigationButton(
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UserInfoScreen(),
                  ),
                );
              },
              title: 'Go to User Info Screen',
            ),
            const SizedBox(
              height: 20.0,
            ),
            NavigationButton(
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PlayersScreen(),
                  ),
                );
              },
              title: 'Go to Players Screen',
            ),
            const SizedBox(
              height: 20.0,
            ),
            NavigationButton(
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DatePicker(),
                  ),
                );
              },
              title: 'Go to Date Picker',
            ),
            const SizedBox(
              height: 20.0,
            ),
            NavigationButton(
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResultsInfoScreen(),
                  ),
                );
              },
              title: 'Go to Results Info Screen',
            ),const SizedBox(
              height: 20.0,
            ),
            NavigationButton(
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductsScreen(),
                  ),
                );
              },
              title: 'Go to Products Screen',
            ),
          ],
        ),
      ),
    );
  }
}
