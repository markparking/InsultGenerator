import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:insultgenerator/ImageClasses.dart';
import 'package:path_provider/path_provider.dart';
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
  var contents  = myFile.readAsStringSync();
  return contents;
}
  @override
  void initState() {
    super.initState();
      ReadFile().then((value) {
        setState(() {
          contents = value;
        });
      });
    }
  var contents;
  Widget build(BuildContext context) {
    var myList = [];
    myList.add(contents);
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: [
            FavoritesImage(),
            Container(
              width: 48.0,
              height: 100.0,

              child: ListView.builder(
                  padding: const EdgeInsets.all(15),

                  itemCount: myList.length,
                  itemBuilder: (context, index){
                    if(index < myList.length){
                    final item = myList[index];
                      return ListTile(
                          title: Text(item,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'BrixtonRg'),));
                      }else{
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                    }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
