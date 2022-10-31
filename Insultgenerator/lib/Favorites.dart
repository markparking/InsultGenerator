


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insultgenerator/Buttons.dart';
import 'package:insultgenerator/ImageClasses.dart';

class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            FavoritesImage(),
            Align(
            ),
          ],
        ),
      ),
    );
  }
}