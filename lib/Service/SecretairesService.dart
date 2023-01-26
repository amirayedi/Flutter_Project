import 'dart:convert';

import 'package:flutterproject/Model/Secretaire.dart';
import 'package:http/http.dart' as http;

class SecretaireService {
  Secretaire? secretaire;

  Future<List<Secretaire>> getAllSecretaire() async {
    var url = "http://localhost:8080/getAllUsers";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    List? list = json.decode(response.body)
        .map((data) => Secretaire.fromJson(data))
        .toList();
    List<Secretaire> secretaires = list!.cast<Secretaire>();
    return secretaires;
  }
}
