import 'package:flutter/material.dart';
import 'package:simple_api_integration/services/api_services.dart';
import 'package:simple_api_integration/widgets/api_text.dart';
import 'package:simple_api_integration/widgets/text_container.dart';

import '../models/players_model.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: FutureBuilder<PlayersModel?>(
        future: apiServices.getPlayersData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final playersInfo = snapshot.data!;
            return ListView.builder(
                itemCount: playersInfo.data.length,
                itemBuilder: (context, index) {
                  final playersDataList = playersInfo.data[index];
                  final teamData = playersDataList.team;
                  final metaData = playersInfo.meta;
                  return Card(
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextContainer(
                            apiData:
                                "Name: ${playersDataList.firstName + playersDataList.lastName}",
                          ),
                          ApiText(
                            apiText:
                                'Team Abbreviation: ${teamData.abbreviation}',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ApiText(
                            apiText: 'Meta Total Pages: ${metaData.totalPages}',
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
    );
  }
}
