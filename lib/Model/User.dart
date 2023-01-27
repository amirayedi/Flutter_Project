import 'dart:convert';


User UserJson(String str) =>
    User.fromJson(json.decode(str));

String UserToJson(User data) => json.encode(data.toJson());
class User {
  int? id;
  String firstName;
  String lastName ;
  String telephone;
  String email;
  String password;


  User({
    this.id,
    required this.firstName, required this.lastName,required this.email,required this.telephone,required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["firstName"], id: json["id"],lastName: json["lastName"],
    email: json["email"], telephone: json["telephone"],password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    'id': id,
    "lastName": lastName,
    "email" :email,
    "telephone": telephone,
    'password' :password,
  };


}
class Users {

  List<User>? userList;

  Users({this.userList});

  factory Users.fromJSON(Map<dynamic, dynamic> json) {
    return Users(userList: parserecipes(json));
  }

  static List<User> parserecipes(doctorJSON) {
    var dList = doctorJSON['users'] as List;
    List<User> userList =
    dList.map((data) => User.fromJson(data)).toList();
    return userList;
  }
}
