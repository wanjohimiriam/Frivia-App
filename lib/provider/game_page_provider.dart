// ignore_for_file: prefer_final_fields, no_leading_underscores_for_local_identifiers, prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  int maxQuestions = 10;
  int _currentQuestions = 0;
  int correctCount =0;

  List? questions;

  BuildContext context;
  GamePageProvider({required this.context}) {
    _dio.options.baseUrl = "https://opentdb.com/api.php?";
    _openQuestionsFromAPI(10, "easy", "boolean");
  }

  Future<void> _openQuestionsFromAPI(
      int amount, String difficulty, String type) async {
    var _response = await _dio.get(
      'https://opentdb.com/api.php?amount=$amount&difficulty=$difficulty&type=$type',
      // queryParameters: {'amount': 10, 'difficulty': 'easy','type': "bolean"},
    );
    var _data = (_response.data as Map);
    // print("Data is: $_data");
    questions = _data["results"];
    // debugPrint("Questions are: $questions");
    notifyListeners();
  }

  String getCurrentQuestionsAPI() {
    //debugPrint("Questions are: $questions");
    return questions![_currentQuestions]['question'] ?? "loading...";
  }

  void answerCurrentQuestions(String _answer) async {
    bool isCorrect = questions![_currentQuestions]['correct_answer'] == _answer;
    correctCount += isCorrect ? 1 : 0;
    _currentQuestions++;
    //print(isCorrect ? "Correct" : "Incorrect");
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return AlertDialog(
            backgroundColor: isCorrect ? Colors.green : Colors.red,
            title: Icon(
              isCorrect ? Icons.check_circle : Icons.cancel_sharp,
              color: Colors.white,
            ),
            
          );
        });
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
    if (_currentQuestions == maxQuestions) {
      endGame();
    } else {
      notifyListeners();
    }
  }

  void endGame() async {
    showDialog(
        context: context,
        builder: (BuildContext _context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            title: Text(
              "End Game",
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            content: Text("score: $correctCount / $maxQuestions"),
          );
        });
    await Future.delayed(Duration(seconds: 3));
    Navigator.pop(context);
    Navigator.pop(context);
  }
}
