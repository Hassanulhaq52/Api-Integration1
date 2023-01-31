import 'package:flutter/material.dart';
import 'package:simple_api_integration/models/comments_model.dart';
import 'package:simple_api_integration/models/test_api_model.dart';
import 'package:simple_api_integration/services/api_services.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: FutureBuilder<List<CommentsModel>?>(
          future: apiServices.getCommentsData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final commentsData = snapshot.data!;
              return Theme(
                data: ThemeData(
                  highlightColor: Colors.grey.shade300,
                ),
                child: Scrollbar(
                  thickness: 10,
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: commentsData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2,),
                        child: Card(
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    'Name: ${commentsData[index].name}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'Email: ${commentsData[index].email}',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'ID: ${commentsData[index].id}',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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
