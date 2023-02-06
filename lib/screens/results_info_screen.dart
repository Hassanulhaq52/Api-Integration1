import 'package:flutter/material.dart';
import 'package:simple_api_integration/models/result_info_model.dart';
import 'package:simple_api_integration/services/api_services.dart';
import 'package:simple_api_integration/widgets/api_text.dart';
import 'package:simple_api_integration/widgets/text_container.dart';

class ResultsInfoScreen extends StatefulWidget {
  const ResultsInfoScreen({Key? key}) : super(key: key);

  @override
  State<ResultsInfoScreen> createState() => _ResultsInfoScreenState();
}

class _ResultsInfoScreenState extends State<ResultsInfoScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: FutureBuilder<ResultsInfoModel?>(
        future: apiServices.getResultsInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final resultsInfoData = snapshot.data!;
            return ListView.builder(
                itemCount: resultsInfoData.results.length,
                itemBuilder: (context, index) {
                  final resultsInformation = resultsInfoData.results[index];
                  final infoData = snapshot.data!.info;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Card(
                      child: ListTile(
                        title: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            resultsInformation.picture.large != 'null'
                                ? Container(
                                    width: double.infinity,
                                    height: 240,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        5.0,
                                      ),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          resultsInformation.picture.large,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )
                                : Container(
                                    margin: const EdgeInsets.all(
                                      10.0,
                                    ),
                                    padding: const EdgeInsets.all(
                                      20.0,
                                    ),
                                    color: Colors.red,
                                    child: const Text(
                                      'Image Not Available',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                            TextContainer(
                              apiData:
                                  "Name: ${'${resultsInformation.name.title} ${resultsInformation.name.first} ${resultsInformation.name.last}'}",
                            ),
                            ApiText(
                              apiText: 'Email: ${resultsInformation.email}',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ApiText(
                              apiText: 'Gender: ${resultsInformation.gender}',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ApiText(
                              apiText:
                                  'Location: Street ${resultsInformation.location.street.name}, ${resultsInformation.location.street.number}',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ApiText(
                              apiText:
                                  'City: ${resultsInformation.location.city}',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ApiText(
                              apiText:
                                  'State: ${resultsInformation.location.state}',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ApiText(
                              apiText:
                                  'Country: ${resultsInformation.location.country}',
                            ),
                            TextContainer(
                              apiData:
                                  "Log In: UUID ${resultsInformation.login.uuid}",
                            ),
                            ApiText(
                              apiText:
                                  'User Name: ${resultsInformation.login.userName}',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ApiText(
                              apiText:
                                  'Password: ${resultsInformation.login.password}',
                            ),
                            TextContainer(
                              apiData:
                                  "DOB: ${resultsInformation.dob.date.split(':').first}",
                            ),
                            ApiText(
                              apiText: 'Age: ${resultsInformation.dob.age}',
                            ),
                            TextContainer(
                              apiData:
                                  "Registered: ${resultsInformation.registered.date.split(':').first}",
                            ),
                            ApiText(
                              apiText:
                                  'Age: ${resultsInformation.registered.age}',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ApiText(
                              apiText: 'Phone: ${resultsInformation.phone}',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ApiText(
                              apiText: 'Cell: ${resultsInformation.cell}',
                            ),
                            TextContainer(
                              apiData: "Info: Seed ${infoData.seed}",
                            ),
                            ApiText(
                              apiText: 'Results: ${infoData.results}',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ApiText(
                              apiText: 'Version: ${infoData.version}',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
