import 'dart:io';
import 'package:insultgenerator/EndScreen.dart';
import 'package:path_provider/path_provider.dart';
class favStorage {
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<File> get localFile async {
    final path = await localPath;
    return File('$path/fav.txt');
  }
  Future<File> writeToFav(var content) async {
    final file = await localFile;
    return file.writeAsString('${newInsult.getInsult}');
  }

  Future<String> readFile() async {
    try {
      final file = await localFile;
      String contents = await file.readAsString();

      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return e.toString();
    }
  }
}
