
import 'dart:convert';


Therapie TherapieJson(String str) =>
    Therapie.fromJson(json.decode(str));

String TherapieToJson(Therapie data) => json.encode(data.toJson());
class Therapie {
  int? id;
  String nom;
  String description ;
  String image;


  Therapie({
    this.id,
    required this.nom, required this.description, required this.image,
  });

  factory Therapie.fromJson(Map<String, dynamic> json) => Therapie(
    nom: json["nom"], id: json["id"],description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "nom": nom,
    'id': id,
    "description": description,
    "image": image,
  };


}
class Therapies {

  List<Therapie>? therapieList;

  Therapies({this.therapieList});

  factory Therapies.fromJSON(Map<dynamic, dynamic> json) {
    return Therapies(therapieList: parserecipes(json));
  }

  static List<Therapie> parserecipes(doctorJSON) {
    var dList = doctorJSON['therapies'] as List;
    List<Therapie> therapieList =
    dList.map((data) => Therapie.fromJson(data)).toList();
    return therapieList;
  }
}
