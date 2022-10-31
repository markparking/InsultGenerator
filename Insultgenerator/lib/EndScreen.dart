import 'package:flutter/material.dart';
import 'package:insultgenerator/ListDatabase.dart';
import 'dart:math';
import 'package:insultgenerator/Buttons.dart';

class EndScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            EndImage(),
          ],
        ),
      ),
    );
  }
}

class EndImage extends StatelessWidget {        //End Image
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('image/End.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
Random rnd = new Random();

class InsultText extends StatelessWidget {

  @override
  var element = list[rnd.nextInt(list.length)];
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            EndImage(),
            Align(
              alignment: FractionalOffset(0.9, 0.3),
              child: Container(
                child: Text(
                    '$element',
                  textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, color: Colors.black, fontFamily: 'BrixtonRg'),
                ),
              )
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child:
              CopyToClipboard(),
            ),
          ],
        ),
      ),
    );
  }
}
