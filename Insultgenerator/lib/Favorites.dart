import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:insultgenerator/ImageClasses.dart';
import 'package:path_provider/path_provider.dart';
final LineSplitter ls = new LineSplitter();
class Favorites extends StatefulWidget {
  Favorites({Key? key}) : super(key: key);
  @override
  State<Favorites> createState() => FavoritesState();
}
class FavoritesState extends State<Favorites> {
  @override
  Future ReadFile() async {
  Directory root = await getApplicationDocumentsDirectory(); // this is using path_provider
  String directoryPath = root.path;
  var myFile = File(directoryPath + '/fav.txt');
  var contents  = myFile.readAsStringSync();//openRead().transform(utf8.decoder).transform(new LineSplitter()).forEach((l) => Text('line: $l'));

  return contents;
}

  @override
  void initState() {
    super.initState();
      ReadFile().then((value) {
        setState(() {
       contents = value;
          myList = ls.convert(contents);
        });
       WidgetsBinding.instance
            .addPostFrameCallback((_) => DeleteFile());
      });
    }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    Directory root = await getApplicationDocumentsDirectory(); // this is using path_provider
    String directoryPath = root.path;
    var myFile = File(directoryPath + '/fav.txt');
    myList.forEach((item) async {
      Directory root = await getApplicationDocumentsDirectory(); // this is using path_provider
      String directoryPath = root.path;
      var myFile = File(directoryPath + '/fav.txt');
      myFile.delete();
      Directory(directoryPath).create(recursive: true);
      var sink = myFile.openWrite(mode: FileMode.append);
      sink.write(item + '\n');
      await sink.flush();
      await sink.close();
    });

  }

  var contents;
  late List<String> myList = [];
  @override
  Widget build(BuildContext context) {                    //Building Widget
      return Scaffold(
          body: Container(
              child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FavoritesImage(),
                    Container(
                        width: 100,
                        height: 400,
                        padding: const EdgeInsets.all(10),
                        margin: EdgeInsets.only(top: 200),
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(15),
                            itemCount: myList.length,
                            itemBuilder: (_, index) => Card(
                                margin: const EdgeInsets.all(10),
                                child:
                                ListTile(                                           //Seperates each insult(index of myList), into listtiles
                                    title: Text(myList[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'BrixtonRg'),),
                                    trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                              onPressed: () async {
                                               String i = myList[index];
                                                await Clipboard.setData(new ClipboardData(text: "$i")).then((_){
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(content: Text('Copied to your clipboard !')));},
                                                        );},
                                                icon: const Icon(Icons.copy)),
                                          IconButton(
                                              onPressed: () {
                                                setState(()  {
                                                  myList.removeAt(index);
                                                  });
                                              }, icon: const Icon(Icons.delete)),
                                        ],
                                    ),
                                ),
                            ),
                        ),
                    ),
                  ],
              ),
          ));
    }
}
DeleteFile() async {

  Directory root = await getApplicationDocumentsDirectory(); // this is using path_provider
  String directoryPath = root.path;
  var myFile = File(directoryPath + '/fav.txt');
  myFile.delete;

}