import 'package:flutter/material.dart';
import 'package:insultgenerator/EndScreen.dart';
import 'package:insultgenerator/Favorites.dart';
import 'package:insultgenerator/LoadingScreen.dart';
import 'package:insultgenerator/main.dart';

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                              //Start Button//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class start extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset ('image/Start-button.png'),
      iconSize: 195,
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => new Loading(),
          ),
        ),
      },
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                              //Favorites Button//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class favoritesButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(
            icon: Image.asset ('image/Favorites-button.png'),
            iconSize: 50,
            onPressed: () => {
            Navigator.push(
              context,

            MaterialPageRoute(builder: (context) => new Favorites(),
          ),
        ),
      });
  }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                  //GenerateNew Button//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class Return extends StatelessWidget {
  const Return({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset ('image/Return-button.png'),
      iconSize: 200,
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home(),
          ),
        ),
      },
    );
  }
}
class Refresh extends StatelessWidget {
  const Refresh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset ('image/Refresh.png'),
      iconSize: 250,
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EndScreen(),
          ),
        ),
      },
    );
  }
}