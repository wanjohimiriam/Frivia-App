// ignore_for_file: non_constant_identifier_names, unused_element, prefer_const_constructors

import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _Good_UI();
  }

  Widget _Good_UI() {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: _gameUI(),
      ),
    ));
  }

  Widget _gameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _textUI(),
      ],
    );
  }
  Widget _textUI() {
    return Text(
      "Test Question 1 nothing Interensting",
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w400
      ),
    );
  }
}
