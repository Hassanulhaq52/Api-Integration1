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
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Email: ${testApiData.email}',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Purpose: ${testApiSupport.text}',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        color: Colors.blue,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'comments_screen');
                            },
                            child: Text(
                              'Go to Comments screen',
                              style: TextStyle(color: Colors.white),
                            ),),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        color: Colors.blue,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'university_info_screen');
                          },
                          child: Text(
                            'Go to University Info screen',
                            style: TextStyle(color: Colors.white),
                          ),),
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
