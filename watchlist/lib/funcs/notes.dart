import 'dart:io';

import 'package:path_provider/path_provider.dart';

class NoteManager {
  static Future<String> get getFilePath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> getFile(String movieTitle) async {
    final path = await getFilePath;
    return File('$path/$movieTitle.txt');
  }

  static Future<File> saveToFile(String movieTitle, String data) async {
    final file = await getFile(movieTitle);
    return file.writeAsString(data);
  }

  static Future<String> readFromFile(String movieTitle) async {
    try {
      final file = await getFile(movieTitle);
      String fileContents = await file.readAsString();
      return fileContents;
    } catch (e) {
      return " ";
    }
  }
}
