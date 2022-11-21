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
    final fList = myList.toSet().toList();
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
                  itemCount: fList.length,
                  itemBuilder: (context, index){
                    if(index < fList.length){
                    final item = fList[index];
                      return ListTile(
                            title: Text(item,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.black, fontFamily: 'BrixtonRg'),
                            ));
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
