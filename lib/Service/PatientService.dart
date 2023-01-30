import 'dart:convert';
import 'package:flutterproject/Model/Patient.dart';
import 'package:flutterproject/Model/RendezVous.dart';
import 'package:http/http.dart' as http;

class PatientService {
  Patient? patient;

  RendezVous? rendezVous;

  Future<http.Response> addRDV(RendezVous rendezVous) async {

    var url = Uri.parse("http://10.0.2.2:8080/rendezvous/createRendezvous/");

    http.Response response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Accept': "*/*",
        'connection': 'keep-alive',
      },
      body: jsonEncode(rendezVous.toJson()),
    );
    print(response.body);

    return response;
  }

  Future<List<RendezVous>> getAllRDV() async {
    var url = "http://10.0.2.2:8080/rendezvous/getAll";
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
        .map((data) => RendezVous.fromJson(data))
        .toList();
    List<RendezVous> secretaires = list!.cast<RendezVous>();
    return secretaires;
  }


  Future<http.Response> updateUserRdv(int? id,RendezVous rendezVous) async {
    var url = Uri.parse("http://10.0.2.2:8080/rendezvous/update/$id");
    http.Response response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Accept': "*/*",
        'connection': 'keep-alive',
      },
      body: jsonEncode(rendezVous.toJson()),
    );
    print(response.body);
    return response;
  }


  Future<List<Patient>> getAllPatient() async {
    var url = "http://localhost:8080/getAllUsers";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    List? list = json.decode(response.body)
        .map((data) => Patient.fromJson(data))
        .toList();
    List<Patient> patients = list!.cast<Patient>();
    return patients;
  }
}
