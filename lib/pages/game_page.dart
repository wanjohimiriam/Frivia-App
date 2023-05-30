// ignore_for_file: non_constant_identifier_names, unused_element, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:frivia_app/provider/game_page_provider.dart';
import 'package:provider/provider.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double? _devWidth, _devHeight;

  GamePageProvider? _pageProvider;

  @override
  Widget build(BuildContext context) {
    _devHeight = MediaQuery.of(context).size.height;
    _devWidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
        create: (_context) => GamePageProvider(context: context),
        child: _Good_UI());
  }

  Widget _Good_UI() {
    return Builder(builder: (_context) {
      _pageProvider = _context.watch<GamePageProvider>();
      return Scaffold(
          body: SafeArea(
        child: Container(
          child: _gameUI(),
        ),
      ));
    });
  }

  Widget _gameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _textUI(),
        Column(
          children: [
            _trueButton(),
            SizedBox(
              height: _devHeight! * 0.01,
            ),
            _falseButton(),
          ],
        )
      ],
    );
  }

  Widget _textUI() {
    return Center(
      child: Text(
        "Test Question 1 nothing Interensting",
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _trueButton() {
    return MaterialButton(
      onPressed: () {},
      color: Colors.green,
      minWidth: _devWidth! * 0.80,
      height: _devHeight! * 0.10,
      child: Text(
        "True",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }

  Widget _falseButton() {
    return MaterialButton(
      onPressed: () {},
      color: Colors.red,
      minWidth: _devWidth! * 0.80,
      height: _devHeight! * 0.10,
      child: Text(
        "False",
        style: TextStyle(color: Colors.white, fontSize: 25),
      ),
    );
  }
}
