import 'dart:convert';


Medecin MedecinJson(String str) =>
    Medecin.fromJson(json.decode(str));

String MedecinToJson(Medecin data) => json.encode(data.toJson());
class Medecin {
  int? id;
  String nom;
  String prenom ;
  String telephone;
  String email;
  String password;


  Medecin({
    this.id,
    required this.nom, required this.prenom,required this.email,required this.telephone,required this.password,
  });

  factory Medecin.fromJson(Map<String, dynamic> json) => Medecin(
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
class Medecins {

  List<Medecin>? medecinList;

  Medecins({this.medecinList});

  factory Medecins.fromJSON(Map<dynamic, dynamic> json) {
    return Medecins(medecinList: parserecipes(json));
  }

  static List<Medecin> parserecipes(doctorJSON) {
    var dList = doctorJSON['medecins'] as List;
    List<Medecin> medecinList =
    dList.map((data) => Medecin.fromJson(data)).toList();
    return medecinList;
  }
}
