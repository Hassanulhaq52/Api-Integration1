import 'package:flutter/material.dart';
import 'package:simple_api_integration/models/covid_cases_model.dart';
import 'package:simple_api_integration/services/api_services.dart';
import 'package:simple_api_integration/widgets/api_text.dart';
import 'package:simple_api_integration/widgets/text_container.dart';
import 'package:simple_api_integration/screens/date_picker.dart';

class CovidCasesScreen extends StatelessWidget {
  CovidCasesScreen({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DatePicker(),
          ),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade500,
        body: FutureBuilder<CovidCasesModel?>(
          future: apiServices.getCovidCases(date),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final covidCasesInfo = snapshot.data!;
              final covidData = covidCasesInfo.data;

              return ListView.builder(itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextContainer(
                          apiData: 'Last Update: ${covidData.lastUpdate}',
                        ),
                        ApiText(
                          apiText: 'Date: ${covidData.date}',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ApiText(
                          apiText:
                              'Confirmed Cases: ${covidData.confirmed.toString()}',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ApiText(
                          apiText: 'Deaths: ${covidData.deaths.toString()}',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ApiText(
                          apiText:
                              'Recovered Cases: ${covidData.confirmed.toString()}',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ApiText(
                          apiText:
                              'Active Cases: ${covidData.active.toString()}',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ApiText(
                          apiText:
                              'Fatality Rate: ${covidData.fatalityRate.toString()}',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
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
      ),
    );
  }
}
