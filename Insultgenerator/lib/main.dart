import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home()
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Stack(
          fit: StackFit.expand,
           children: [
             Background(),
             Align(
               alignment: Alignment.bottomLeft,
               child: Clean(),
             ),
             Align(
               alignment: Alignment.bottomRight,
               child: Dirty(),
             )
             //Dirty(),
           ],
        ),
      ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                        //Buttons//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Clean extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset ('image/Clean.png'),
      iconSize: 195,
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Loading()
          ),
        ),
      },
    );
  }
}

class Dirty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset('image/Dirty.png'),
      iconSize: 195,
      onPressed: () => {
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Loading()
          ),
        ),
      },
    );
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                        //Loading Screen//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


class Loading extends StatelessWidget {

  @override

    Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            LImage(),
            End(),
          ],
        ),
      ),
    );
    }
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                          //END Screen//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class End extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                      //Image Builders//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class Background extends StatelessWidget {        //Start image
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('image/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LImage extends StatelessWidget {            //Loading image
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

void setTimeout(callback, time) {
  Duration timeDelay = Duration(seconds: 3);
  Timer(timeDelay, callback);
}