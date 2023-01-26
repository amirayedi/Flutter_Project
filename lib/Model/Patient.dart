import 'dart:convert';


Patient PatientJson(String str) =>
    Patient.fromJson(json.decode(str));

String PatientToJson(Patient data) => json.encode(data.toJson());
class Patient {
  int? id;
  String nom;
  String prenom ;
  String telephone;
  String email;
  String password;


  Patient({
    this.id,
    required this.nom, required this.prenom,required this.email,required this.telephone,required this.password,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
      nom: json["nom"], id: json["id"],prenom: json["prenom"],
      email: json["email"], telephone: json["telephone"],password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "nom": nom,
    'id': id,
    "prenom": prenom,
    "email" :email,
    "telephone": telephone,
    'password' :password,
  };


}
class Patients {

  List<Patient>? patientList;

  Patients({this.patientList});

  factory Patients.fromJSON(Map<dynamic, dynamic> json) {
    return Patients(patientList: parserecipes(json));
  }

  static List<Patient> parserecipes(doctorJSON) {
    var dList = doctorJSON['patients'] as List;
    List<Patient> patientList =
    dList.map((data) => Patient.fromJson(data)).toList();
    return patientList;
  }
}
