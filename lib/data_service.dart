import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class UserService {
//methode pour recuperer un fichier
  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return File("${directory.path}/data.json");
  }

//methode pour recuperer les donnees
  Future<List<dynamic>> getUsers() async {
    try {
      // final file = await _getLocalFile();
      final file = await _getLocalFile();
      String content = await file.readAsString();
      return jsonDecode(content);
    } catch (e) {
      print("Erreur de lecture:$e");
      return [];
    }
  }

  //methode pour ajouter les infos saisi
  Future<void> saveUser(user) async {
    print("user:$user");
    // print("data:$data");
    try {
      var data = await getUsers();
      data.add(user);
      final file = await _getLocalFile();
      file.writeAsString(jsonEncode(data));
      print("Ajout success");
      print("donne ajouter:$data");
    } catch (e) {
      print("Erreur :$e");
    }
  }
}
