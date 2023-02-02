import 'package:flutter/material.dart';
import 'package:simple_api_integration/models/test_api_model.dart';
import 'package:simple_api_integration/services/api_services.dart';

class TestApiScreen extends StatefulWidget {
  const TestApiScreen({Key? key}) : super(key: key);

  @override
  State<TestApiScreen> createState() => _TestApiScreenState();
}

class _TestApiScreenState extends State<TestApiScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<TestApiModel?>(
          future: apiServices.getTestData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final Data testApiData = snapshot.data!.data;
              final Support testApiSupport = snapshot.data!.support;

              return Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      testApiData.avatar != 'null'
                          ? Container(
                              width: double.infinity,
                              height: 240,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image:
                                        NetworkImage(testApiData.avatar ?? ''),
                                    fit: BoxFit.fill),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(20),
                              color: Colors.red,
                              child: const Text(
                                "Image not available",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'Name: ${testApiData.first_name + ' ' + testApiData.last_name}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Email: ${testApiData.email}',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Purpose: ${testApiSupport.text}',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
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
                        }, title: 'Go to Comments Screen',
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
                        }, title: 'Go to University Info Screen',
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
                        }, title: 'Go to User Info Screen',
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class NavigationButton extends StatelessWidget {
  const NavigationButton({
    super.key,
    required this.onpressed,
    required this.title,
  });

  final Function() onpressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: TextButton(
        onPressed: onpressed,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
