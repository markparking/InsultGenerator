import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insultgenerator/ListDatabase.dart';
import 'dart:math';
import 'package:insultgenerator/Buttons.dart';
import 'package:insultgenerator/ImageClasses.dart';
import 'package:insultgenerator/SettingsMenu.dart';
import 'package:path_provider/path_provider.dart';

Random rnd = new Random();
Gfg newInsult = Gfg();
class Gfg {                                     //get and set class which saves the generated insult
  late String insult;

  String get getInsult {
    return insult;
  }
  set setInsult(String finalInsult) {
    insult = finalInsult;
  }
}

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

class InsultText extends StatefulWidget {           //Stateful widget which initializes a new object state (InsultTestState)
  const InsultText({Key? key}) : super(key: key);

  @override
  State<InsultText> createState() => InsultTextState();
}

class InsultTextState extends State<InsultText> {

   @override
  Widget build(BuildContext context) {      //Creates new insult object from the Gfg class
     newInsult.setInsult = list[rnd.nextInt(list.length)];          //giving the Gfg newInsult object a value randomly from the database.
     return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            EndImage(),
            Container(
              child: Align(
                alignment: FractionalOffset(0.9, 0.3),
                child: Container(
                  child: Text(
                    '${newInsult.getInsult}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, color: Colors.black, fontFamily: 'BrixtonRg'),
                  ),
                ),
              ),
            ),
            Container(
              child:
              Align(
                alignment: Alignment(-1.1, -0.05),
                child: CopyToClipboard(),
            ),
            ),
          Container(
          child:
          Align(
            alignment: Alignment(1.0, 0.4),
            child: Return(),
            ),
        ),
          Container(
          child:
          Align(
            alignment: Alignment(1.1, -0.05),
            child: SaveToFavorites(),
            ),
          ),
            Container(
              child: Align(
                alignment: Alignment(-1.5, 0.6),
                child:
                IconButton(
                  icon: Image.asset ('image/Refresh.png'),
                  iconSize: 250,

                  onPressed: () => {
                  setState(()  {

                  }),
                  },
                ),
              ),
            ),
          ],
        ),
     ));
  }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                            //Copy to Clipboard Button + SaveToFavorites button//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class CopyToClipboard extends StatelessWidget {
  //var clipInsult = newInsult.getInsult;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.asset ('image/Copy-Button.png'),
        iconSize: 150,
        onPressed: () async {
          await Clipboard.setData(new ClipboardData(text: "${newInsult.getInsult}")).then((_){
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Copied to your clipboard !')));
          });
        });
  }
}

class SaveToFavorites extends StatefulWidget{
  const SaveToFavorites({Key? key}) : super(key: key);

  @override
  State<SaveToFavorites> createState() => SaveToFavoritesState();
}


class SaveToFavoritesState extends State<SaveToFavorites> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Image.asset('image/Save-Ribbon.png'),
        iconSize: 150,
        onPressed: () async {
          requestStoragePermission;
        Directory root = await getApplicationDocumentsDirectory(); // this is using path_provider
          String directoryPath = root.path;
          var myFile = File(directoryPath + '/fav.txt');
          var b = await File(directoryPath + '/fav.txt').exists();

          if(b = true) {
         }
          else{
            await Directory(directoryPath).create(recursive: true);
          }
         var sink = myFile.openWrite(mode: FileMode.append); // for appending at the end of file, pass parameter (mode: FileMode.append) to openWrite()
          sink.write('${newInsult.getInsult}\n');
          await sink.flush();
          await sink.close();
            ScaffoldMessenger.of(context)
                .showSnackBar(
                SnackBar(content: Text('Saved to Favorites!')));
          });
          }
}