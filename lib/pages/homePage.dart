// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:frivia_app/pages/game_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double currentValue = 0;
  double? _devWidth, _devHeight;
  @override
  Widget build(BuildContext context) {
    _devHeight = MediaQuery.of(context).size.height;
    _devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Frivia",
                    style: TextStyle(color: Colors.white, fontSize: 40)),
                Text(
                  "easy",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            Slider(
                value: currentValue,
                activeColor: Colors.blue,
                inactiveColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    currentValue = value;
                  });
                }),
            MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext) {
                  return GamePage();
                }));
              },
              color: Colors.blue,
              minWidth: _devWidth! * 0.80,
              height: _devHeight! * 0.10,
              child: Text(
                "Start",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            )
          ],
        ),
      )),
    );
  }
}
