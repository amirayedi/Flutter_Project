import 'dart:convert';


Secretaire SecretaireJson(String str) =>
    Secretaire.fromJson(json.decode(str));

String SecretaireToJson(Secretaire data) => json.encode(data.toJson());
class Secretaire {
  int? id;
  String nom;
  String prenom ;
  String telephone;
  String email;
  String password;


  Secretaire({
    this.id,
    required this.nom, required this.prenom,required this.email,required this.telephone,required this.password,
  });

  factory Secretaire.fromJson(Map<String, dynamic> json) => Secretaire(
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
class Secretaires {

  List<Secretaire>? secretaireList;

  Secretaires({this.secretaireList});

  factory Secretaires.fromJSON(Map<dynamic, dynamic> json) {
    return Secretaires(secretaireList: parserecipes(json));
  }

  static List<Secretaire> parserecipes(doctorJSON) {
    var dList = doctorJSON['secretaires'] as List;
    List<Secretaire> secretaireList =
    dList.map((data) => Secretaire.fromJson(data)).toList();
    return secretaireList;
  }
}
