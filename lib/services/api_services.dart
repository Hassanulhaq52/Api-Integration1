import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_api_integration/models/comments_model.dart';
import 'package:simple_api_integration/models/bio_model.dart';
import 'package:simple_api_integration/models/covid_cases_model.dart';
import 'package:simple_api_integration/models/players_model.dart';
import 'package:simple_api_integration/models/result_info_model.dart';
import 'package:simple_api_integration/models/user_info_model.dart';
import '../models/university_info_model.dart';

class ApiServices {
  static const String baseUrlTestData = 'https://reqres.in/api/users/2';

  Future<BioModel?> getBioData() async {
    try {
      Uri url = Uri.parse(baseUrlTestData);

      http.Response response = await http.get(url);
      debugPrint('Response status: ${response.statusCode}');

      final body = jsonDecode(response.body);
      debugPrint(response.body);

      if (response.statusCode == 200) {
        BioModel bioData = BioModel.fromJson(body);
        return bioData;
      } else {
        debugPrint('ERROR : ${response.statusCode}');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  static const baseUrlComments =
      'https://jsonplaceholder.typicode.com/comments';

  Future<List<CommentsModel>?> getCommentsData() async {
    try {
      Uri url = Uri.parse(baseUrlComments);

      http.Response response = await http.get(url);

      debugPrint('Response Status: ${response.statusCode}');

      final List body = jsonDecode(response.body);
      debugPrint(response.body);

      if (response.statusCode == 200) {
        List<CommentsModel> commentsInfo =
            body.map((e) => CommentsModel.fromJson(e)).toList();
        return commentsInfo;
      } else {
        debugPrint('ERROR: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  static const baseUrlUniversityInfo =
      'http://universities.hipolabs.com/search?country=United+States';

  Future<List<UniversityInfoModel>?> getUniversityInfo() async {
    try {
      Uri url = Uri.parse(baseUrlUniversityInfo);
      http.Response response = await http.get(url);
      debugPrint('Response Status: ${response.statusCode}');
      final List body = jsonDecode(response.body);
      debugPrint("$body");

      if (response.statusCode == 200) {
        List<UniversityInfoModel> universityInfo =
            body.map((e) => UniversityInfoModel.fromJson(e)).toList();
        return universityInfo;
      } else {
        debugPrint('ERROR: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  static const baseUrlUserInfo = 'https://jsonplaceholder.typicode.com/users';

  Future<List<UserInfoModel>?> getUserInfo() async {
    try {
      Uri url = Uri.parse(baseUrlUserInfo);

      http.Response response = await http.get(url);

      debugPrint('Response Status: ${response.statusCode}');

      final List body = jsonDecode(response.body);

      debugPrint("$body");

      if (response.statusCode == 200) {
        List<UserInfoModel> userInfo =
            body.map((e) => UserInfoModel.fromJson(e)).toList();

        return userInfo;
      } else {
        debugPrint('ERROR: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  static const baseUrlPlayers = 'https://free-nba.p.rapidapi.com/';
  static const endPointPlayers = 'players';

  Future<PlayersModel?> getPlayersData() async {
    try {
      Uri url = Uri.parse(baseUrlPlayers + endPointPlayers);
      http.Response response = await http.get(url, headers: {
        'X-RapidAPI-Key': 'f02c7294cbmshdba44773aba5dbap1f7c91jsn0ccc1099845d',
        'X-RapidAPI-Host': 'free-nba.p.rapidapi.com'
      });

      debugPrint('Response Status: ${response.statusCode}');

      final body = jsonDecode(response.body);

      debugPrint(response.body);

      if (response.statusCode == 200) {
        PlayersModel playersData = PlayersModel.fromJson(body);
        return playersData;
      } else {
        debugPrint('ERROR: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }


  static const baseUrlDate = 'https://covid-19-statistics.p.rapidapi.com/';

  Future<CovidCasesModel?> getCovidCases(String date) async {
    final endPointDate = 'reports/total?date=$date';
    try {
      Uri url = Uri.parse(baseUrlDate + endPointDate);

      http.Response response = await http.get(url, headers: {
        'X-RapidAPI-Key': 'f02c7294cbmshdba44773aba5dbap1f7c91jsn0ccc1099845d',
        'X-RapidAPI-Host': 'covid-19-statistics.p.rapidapi.com'
      });

      debugPrint('Response Status: ${response.statusCode}');

      final body = jsonDecode(response.body);

      debugPrint(response.body);

      if (response.statusCode == 200) {
        CovidCasesModel covidCasesData = CovidCasesModel.fromJson(body);
        return covidCasesData;
      } else {
        debugPrint('ERROR: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  static const baseUrlResultsInfo = 'https://randomuser.me/';

  Future<ResultsInfoModel?> getResultsInfo() async {

    const String endPointResultsInfo = 'api/';
    try {
      Uri url = Uri.parse(baseUrlResultsInfo + endPointResultsInfo);

      http.Response response = await http.get(url);

      debugPrint('Response Status: ${response.statusCode}');

      final body = jsonDecode(response.body);

      debugPrint(response.body);

      if (response.statusCode == 200) {
        ResultsInfoModel resultsInfo = ResultsInfoModel.fromJson(body);
        return resultsInfo;
      } else {
        debugPrint('ERROR: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

}

