
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
class LoadingImage extends StatelessWidget {
  //Loading image
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
class FavoritesImage extends StatelessWidget {
  //Loading image
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
