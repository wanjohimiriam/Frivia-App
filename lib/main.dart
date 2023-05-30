// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:frivia_app/pages/game_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "ArchitectsDaughters",
          scaffoldBackgroundColor: Color.fromRGBO(31, 31, 31, 1.0)),
      home: GamePage(),
    );
  }
}