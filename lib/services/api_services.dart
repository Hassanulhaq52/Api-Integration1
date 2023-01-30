import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:simple_api_integration/models/comments_model.dart';
import 'package:simple_api_integration/models/test_api_model.dart';

import '../models/university_info_model.dart';

class ApiServices {
  static const String baseUrlTestData = 'https://reqres.in/api/users/2';

  Future<TestApiModel?> getTestData() async {
    try {
      Uri url = Uri.parse(baseUrlTestData);

      http.Response response = await http.get(url);
      debugPrint('Response status: ${response.statusCode}');

      final body = jsonDecode(response.body);
      debugPrint(response.body);

      if (response.statusCode == 200) {
        TestApiModel testApiModel = TestApiModel.fromJson(body);
        return testApiModel;
      } else {
        debugPrint('ERROR : ${response.statusCode}');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  static const baseUrlComments = 'https://jsonplaceholder.typicode.com/comments';

  Future<CommentsModel?> getCommentsData() async {
    try {
      Uri url = Uri.parse(baseUrlComments);

      http.Response response = await http.get(url);

      debugPrint('Response Status: ${response.statusCode}');

      final body = jsonDecode(response.body);
      debugPrint(response.body);

      if (response.statusCode == 200) {
        CommentsModel commentsData = CommentsModel.fromJson(body);
        return commentsData;
      } else {
        debugPrint('ERROR: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  static const baseUrlUniversityInfo = 'http://universities.hipolabs.com/search?country=United+States';

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
}
