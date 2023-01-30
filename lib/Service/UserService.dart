


import 'dart:convert';
import 'dart:async';
import 'package:flutterproject/Model/User.dart';
import 'package:http/http.dart' as http;

class UserService {
  User? user;

  Future<List<User>> getAllSecretaire() async {
    var url = "http://10.0.2.2:8080/user/getAllSecretaire";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Accept': "*/*",
        'connection': 'keep-alive',
      },
    );
    print(json.decode(response.body).toString());
    //print( json.decode(response.body));
    List? list = json.decode(response.body)
        .map((data) => User.fromJson(data))
        .toList();
    List<User> secretaires = list!.cast<User>();
    return secretaires;
  }

  Future<http.Response> updateUser(int? id,User user) async {
    var url = Uri.parse("http://10.0.2.2:8080/user/update/$id");
    http.Response response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Accept': "*/*",
        'connection': 'keep-alive',
      },
      body: jsonEncode(user.toJson()),
    );
    print(response.body);
    return response;
  }

  Future<http.Response> addUser(User user) async {

    var url = Uri.parse("http://10.0.2.2:8080/user/createUser");

    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Accept': "*/*",
        'connection': 'keep-alive',
      },
      body: jsonEncode(user.toJson()),
    );
    print(response.body);

    return response;
  }

  Future<http.Response> deleteUser(int? id) async {
    var url = Uri.parse("http://10.0.2.2:8080/user/delete/$id");
    http.Response response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Accept': "*/*",
        'connection': 'keep-alive',
      },
    );
    print(response.body);
    return response;
  }


  Future<List<User>> getAllUser() async {
    var url = "http://10.0.2.2:8080/getAllUsers";
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
      print(users);
      return users;
    }
    else {
      throw Exception('Failed to load album');
    }
  }
}