import 'dart:convert';
import 'package:flutterproject/Model/Medecin.dart';


import 'package:http/http.dart' as http;

class MedecinService {
  Medecin? medecin;

  Future<List<Medecin>> getAllMedecin() async {
    var url = "http://localhost:8080/getAllUsers";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    List? list = json.decode(response.body)
        .map((data) => Medecin.fromJson(data))
        .toList();
    List<Medecin> medecins = list!.cast<Medecin>();
    return medecins;
  }
}
