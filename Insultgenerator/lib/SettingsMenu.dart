import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


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