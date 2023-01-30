import 'dart:convert';
import 'dart:async';
import 'package:flutterproject/Model/Therapie.dart';
import 'package:flutterproject/Model/User.dart';
import 'package:http/http.dart' as http;

class TherapieService {
  Therapie? therapie;
  User? user;

  Future<List<Therapie>> getAllTherapie() async {
    var url = "http://10.0.2.2:8080/therapie/getAll";
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
        .map((data) => Therapie.fromJson(data))
        .toList();
    List<Therapie> therapies = list!.cast<Therapie>();
    return therapies;
  }

  Future<http.Response> updateTherapie(int? id,Therapie therapie) async {
    var url = Uri.parse("http://10.0.2.2:8080/therapie/update/$id");
    http.Response response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Accept': "*/*",
        'connection': 'keep-alive',
      },
      body: jsonEncode(therapie.toJson()),
    );
    print(response.body);
    return response;
  }

  Future<http.Response> addtherapie(Therapie therapie) async {

    var url = Uri.parse("http://10.0.2.2:8080/therapie/createTherapie/");

    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Accept': "*/*",
        'connection': 'keep-alive',
      },
      body: jsonEncode(therapie.toJson()),
    );
    print(response.body);

    return response;
  }

  Future<http.Response> deletetherapie(int? id) async {
    var url = Uri.parse("http://10.0.2.2:8080/therapie/delete/$id");
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
