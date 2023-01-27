import 'dart:convert';
import 'dart:async';
import 'package:flutterproject/Model/Secretaire.dart';
import 'package:flutterproject/Model/User.dart';
import 'package:http/http.dart' as http;

class SecretaireService {
  Secretaire? secretaire;
  User? user;

  Future<List<Secretaire>> getAllSecretaire() async {
    var url = "http://localhost:8080/getAllUsers";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
      'Accept': "*/*",
      'connection': 'keep-alive',
      },
    );
    print(json.decode(response.body));
    List? list = json.decode(response.body)
        .map((data) => Secretaire.fromJson(data))
        .toList();
    List<Secretaire> secretaires = list!.cast<Secretaire>();
    return secretaires;
  }


  Future<List<User>> getAllUser() async {
    var url = "http://127.0.0.1:8080/getAllUsers";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri
      ,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Accept': "*/*",
        'connection': 'keep-alive',
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      List? list = json.decode(response.body)
          .map((data) => User.fromJson(data))
          .toList();
      List<User> users = list!.cast<User>();
      return users;
    }
    else {
      throw Exception('Failed to load album');
    }
  }
}
