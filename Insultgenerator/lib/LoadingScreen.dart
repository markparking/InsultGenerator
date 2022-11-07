import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:insultgenerator/EndScreen.dart';
import 'package:insultgenerator/ImageClasses.dart';
import 'package:insultgenerator/ListDatabase.dart';

class Loading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoadingState();
  }
}

class LoadingState extends State<Loading> {
  @override
  void initState() {
     super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }
  route() {
    Navigator.pushReplacement(context, new MaterialPageRoute(
        builder: (context) => new InsultText()
    ),
    );
  }
  initScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            LoadingImage(),
          ],
        ),
      ),
    );
  }
}