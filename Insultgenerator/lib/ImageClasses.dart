import 'package:flutter/cupertino.dart';

class Background extends StatelessWidget {        //Start image
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('image/bge.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LoadingImage extends StatelessWidget {                   //Loading image
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('image/Loading.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class FavoritesImage extends StatelessWidget {              //Favorites menu image
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('image/Favorites.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class EndImage extends StatelessWidget {              //End Image
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

class SettingsImage extends StatelessWidget {                   //Loading image
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('image/SettingsImage.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}