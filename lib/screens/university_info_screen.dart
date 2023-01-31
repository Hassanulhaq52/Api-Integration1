import 'package:flutter/material.dart';
import 'package:simple_api_integration/models/university_info_model.dart';
import 'package:simple_api_integration/services/api_services.dart';

class UniversityInfoScreen extends StatefulWidget {
  const UniversityInfoScreen({Key? key}) : super(key: key);

  @override
  State<UniversityInfoScreen> createState() => _UniversityInfoScreenState();
}

class _UniversityInfoScreenState extends State<UniversityInfoScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: FutureBuilder<List<UniversityInfoModel>?>(
          future: apiServices.getUniversityInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final universityData = snapshot.data!;
              return Theme(
                data: ThemeData(
                  highlightColor: Colors.grey.shade300,
                ),
                child: Scrollbar(
                  thickness: 10,
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: universityData.length,
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
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    'University Name: ${universityData[index].name}',
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
                                  'Country: ${universityData[index].country}',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Web Page: ${universityData[index].webPages[0]}',
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Domain: ${universityData[index].domains[0]}',
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
