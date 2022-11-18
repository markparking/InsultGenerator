import 'package:flutter/material.dart';
import 'package:insultgenerator/Favorites.dart';
import 'package:insultgenerator/LoadingScreen.dart';
import 'package:insultgenerator/SettingsMenu.dart';
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
          MaterialPageRoute(builder: (context) => Favorites(),
          ),
        ),
      },
    );
  }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                 //Save-To-Favorites Button//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class SaveToFavoritesButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset ('image/Save-button.png'),
      iconSize: 50,
      onPressed: () => {

      }
    );
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                                               //Settings Button//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset ('image/SettingsIcon.png'),
      iconSize: 50,
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingsMenu(),
          ),
        ),
      },
    );
  }
}
