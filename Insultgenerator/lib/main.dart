import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insultgenerator/Buttons.dart';
import 'package:insultgenerator/ImageClasses.dart';

void main() => runApp(MaterialApp(
    home: Home()
        
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
           children: [
             Background(),
             Align(
               alignment: Alignment.bottomCenter,
               child: start(),
             ),
             Align(
               alignment: Alignment.bottomLeft,
                 child: favoritesButton(),
             ),
           ],
        ),
      ),
    );
  }
}