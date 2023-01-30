import 'dart:convert';



RendezVous RendezVousJson(String str) =>
    RendezVous.fromJson(json.decode(str));

String RendezVousToJson(RendezVous data) => json.encode(data.toJson());
class RendezVous {
  int? id;
  String nom;
  String prenom ;
  String telephone;
  String email;
  String therapie;
  String temps1;
  String arrivee;

  RendezVous({
    this.id,
    required this.nom, required this.prenom,required this.email,required this.telephone,required this.therapie,
    required this.temps1, required this.arrivee,
  });

  factory RendezVous.fromJson(Map<String, dynamic> json) => RendezVous(
    nom: json["nom"], id: json["id"],prenom: json["prenom"],
    email: json["email"], telephone: json["telephone"],therapie: json["therapie"],
    temps1: json["temps1"],arrivee: json["arrivee"],
  );

  Map<String, dynamic> toJson() => {
    "nom": nom,
    'id': id,
    "prenom": prenom,
    "email" :email,
    "telephone": telephone,
    'therapie' :therapie,
    'temps1':temps1,
    'arrivee':arrivee,
  };


}
class RendezVouss {

  List<RendezVous>? rendezVousList;

  RendezVouss({this.rendezVousList});

  factory RendezVouss.fromJSON(Map<dynamic, dynamic> json) {
    return RendezVouss(rendezVousList: parserecipes(json));
  }

  static List<RendezVous> parserecipes(doctorJSON) {
    var dList = doctorJSON['rendezvous'] as List;
    List<RendezVous> rendezVousList =
    dList.map((data) => RendezVous.fromJson(data)).toList();
    return rendezVousList;
  }
}
