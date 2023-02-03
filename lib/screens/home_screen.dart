import 'package:flutter/material.dart';
import 'package:simple_api_integration/screens/bio_screen.dart';
import 'package:simple_api_integration/screens/comments_screen.dart';
import 'package:simple_api_integration/screens/covid_cases_screen.dart';
import 'package:simple_api_integration/screens/date_picker.dart';
import 'package:simple_api_integration/screens/players_screen.dart';
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
            // NavigationButton(
            //   onpressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => CovidCasesScreen(),
            //       ),
            //     );
            //   },
            //   title: 'Go to Covid Cases Screen',
            // ),
            // const SizedBox(
            //   height: 20.0,
            // ),
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
          ],
        ),
      ),
    );
  }
}
