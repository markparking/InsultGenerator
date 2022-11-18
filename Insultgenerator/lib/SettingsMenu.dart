import 'dart:io';
import 'package:flutter/material.dart';
import 'package:insultgenerator/ImageClasses.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
class SettingsMenu extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            SettingsImage(),
              ElevatedButton(onPressed: requestStoragePermission,
                child: Text("Request Storage Permissions", style: TextStyle(fontSize: 16,),),
            ),
            ElevatedButton(onPressed: createFavFolder, child: Text("Create favorites folder", style: TextStyle(fontSize: 16,),),)
          ],
        ),
      ),
    );
  }
}

void requestStoragePermission() async{
  var status = await Permission.storage.status;
  if(status.isGranted) {
    createFavFolder;
    print("permission is granted");
  }
  else if(status.isDenied) {
    if (await Permission.storage.request().isGranted) {
      print("permission was granted");
    }
  }
}
void createFavFolder() async{
  Directory root = await getApplicationDocumentsDirectory(); //using path_provider
  String directoryPath = root.path;
  await Directory(directoryPath).create(recursive: true);
  }