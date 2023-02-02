import 'package:flutter/material.dart';
import 'package:simple_api_integration/models/user_info_model.dart';
import 'package:simple_api_integration/services/api_services.dart';
import 'package:simple_api_integration/widgets/api_text.dart';
import 'package:simple_api_integration/widgets/text_container.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({Key? key}) : super(key: key);

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: FutureBuilder<List<UserInfoModel>?>(
          future: apiServices.getUserInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!;

              return Theme(
                data: ThemeData(
                  highlightColor: Colors.grey.shade300,
                ),
                child: Scrollbar(
                  thickness: 10,
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: userData.length,
                    itemBuilder: (context, index) {
                      final addressData = userData[index].address;
                      final companyData = userData[index].company;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        child: Card(
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextContainer(
                                  apiData: 'Name: ${userData[index].name}',
                                ),
                                ApiText(
                                  apiText: 'Email: ${userData[index].email}',
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                ApiText(
                                  apiText: 'ID: ${userData[index].id}',
                                ),
                                TextContainer(
                                  apiData: 'Address: ${addressData.city}',
                                ),
                                ApiText(
                                  apiText: 'Suite: ${addressData.suite}',
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                ApiText(
                                  apiText: 'Street: ${addressData.street}',
                                ),
                                TextContainer(
                                  apiData: 'Company Name: ${companyData.name}',
                                ),
                                ApiText(
                                  apiText:
                                      'Catch Phrase: ${companyData.catchPhrase}',
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                ApiText(
                                  apiText: 'BS: ${companyData.bs}',
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
