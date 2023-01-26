import 'dart:convert';
import 'package:flutterproject/Model/Patient.dart';
import 'package:http/http.dart' as http;

class PatientService {
  Patient? patient;

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
