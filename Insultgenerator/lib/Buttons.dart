import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insultgenerator/Favorites.dart';
import 'package:insultgenerator/LoadingScreen.dart';
import 'package:flutter/services.dart';
import 'package:insultgenerator/EndScreen.dart';

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
          MaterialPageRoute(builder: (context) => Loading(),
          ),
        ),
      },
    );
  }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                              //Copy to Clipboard Button//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class CopyToClipboard extends StatelessWidget {
  get insult => null;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.asset ('image/Copy-Button.png'),
        iconSize: 250,
        onPressed: () async {
          await Clipboard.setData(new ClipboardData(text: '$insult')).then((_){
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Copied to your clipboard !')));
          });
        });
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