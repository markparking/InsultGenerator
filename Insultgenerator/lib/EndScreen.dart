import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insultgenerator/EndScreen.dart';
import 'package:insultgenerator/ListDatabase.dart';
import 'dart:math';
import 'package:insultgenerator/Buttons.dart';
Random rnd = new Random();
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

class EndImage extends StatelessWidget {//End Image
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
class Gfg {
  late String insult;

  String get getInsult {
    return insult;
  }
  set setInsult(String finalInsult) {
    insult = finalInsult;
  }
}
class InsultText extends StatefulWidget {
  const InsultText({Key? key}) : super(key: key);
  @override
  State<InsultText> createState() => InsultTextState();
}
Gfg newInsult = Gfg();
class InsultTextState extends State<InsultText> {

   @override
  Widget build(BuildContext context) {
     newInsult.setInsult = list[rnd.nextInt(list.length)];
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
                    '${newInsult.getInsult}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, color: Colors.black, fontFamily: 'BrixtonRg'),
                  ),
                ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child:
              CopyToClipboard(),
            ),
            Align(
              alignment: Alignment.center,
              child:
              Return(),
            ),
          ],
        ),
      ),
    );
  }
}
class CopyToClipboard extends StatelessWidget {
  var clipInsult = newInsult.getInsult;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.asset ('image/Copy-Button.png'),
        iconSize: 250,
        onPressed: () async {
          await Clipboard.setData(new ClipboardData(text: "${newInsult.getInsult}")).then((_){
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Copied to your clipboard !')));
          });
        });
  }
}
