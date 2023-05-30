import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  int maxQuestions = 10;

  List? questions;
  BuildContext context;
  GamePageProvider({required this.context}) {
    _dio.options.baseUrl = "https://opentdb.com/api.php";
    _openQuestionsFromAPI();
  }

  Future<void> _openQuestionsFromAPI() async {
    var _response = await _dio.get(
      '',
      queryParameters: {'amount': 10, 'type': "bolean", 'difficulty': 'easy'},
    );
    var _data = jsonDecode(_response.toString());
    questions= _data["results"];
  }
}
