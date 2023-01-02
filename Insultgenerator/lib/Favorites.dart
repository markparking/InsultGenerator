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
  final GlobalKey<FavoritesState> favoritesKey = GlobalKey<FavoritesState>();
  @override
  State<Favorites> createState() => FavoritesState();
}
class FavoritesState extends State<Favorites> {
  // Declare myFile at the top of the class
  late File myFile;
  @override

  Future ReadFile() async {
    Directory root = await getApplicationDocumentsDirectory(); // this is using path_provider
    String directoryPath = root.path;
    var myFile = File(directoryPath + '/fav.txt');
    var contents = myFile
        .readAsStringSync(); //openRead().transform(utf8.decoder).transform(new LineSplitter()).forEach((l) => Text('line: $l'));

    return contents;
  }

  @override
  void initState()  {
    super.initState();
    getApplicationDocumentsDirectory().then((root) {
      String directoryPath = root.path;
      myFile = File(directoryPath + '/fav.txt');
      ReadFile().then((value) {
        setState(() {
          contents = value;
          myList = ls.convert(contents);
        });

        WidgetsBinding.instance
            .addPostFrameCallback((_) => DeleteFile());
      });
    });
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    Directory root = await getApplicationDocumentsDirectory();
    String directoryPath = root.path;
    var myFile = File(directoryPath + '/fav.txt');
    String contents = await myFile.readAsString();

    // Update myList with the new contents
    setState(() {
      myList = ls.convert(contents);
    });
  }
  void addItem(String item) {
    setState(() {
      myList.add(item);
    });

    // Delete the file
    myFile.delete();

    // Re-create the file
    myFile.create();

    // Write the updated contents of myList to the file
    myFile.writeAsString(myList.join('\n'));
  }

  void deleteItem(int index) {
    setState(() {
      myList.removeAt(index);
    });

    // Delete the file
    myFile.delete();

    // Re-create the file
    myFile.create();

    // Write the updated contents of myList to the file
    myFile.writeAsString(myList.join('\n'));
  }

    /*Directory root = await getApplicationDocumentsDirectory(); // this is using path_provider
    String directoryPath = root.path;
    var myFile = File(directoryPath + '/fav.txt');
    RandomAccessFile raf = myFile.openSync();
    raf.truncate(0);
    myList.forEach((item) async {
      Directory root = await getApplicationDocumentsDirectory(); // this is using path_provider
      String directoryPath = root.path;
      var myFile = File(directoryPath + '/fav.txt');
      Directory(directoryPath).create(recursive: true);
      var sink = myFile.openWrite(mode: FileMode.append);
      sink.write(item + ", ");
      sink.close();*/
/*    });

    // Read the contents of the file into a list
    List<String> fileContents = myFile.readAsLinesSync();

    // Update the data source for the ListView.builder
    setState(() {
      myList = fileContents;
    });*/


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
                                                  deleteItem(index);

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