import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutterproject/Page/SignUpPage.dart';
import 'package:flutterproject/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/User.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  User? user =User(email: "",password: "", nom: '', prenom: '', telephone: '', role: '');
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  User? userLoggedIn ;

  String url = "http://10.0.2.2:8080/user/login";
  Future save() async{
    var res = await http.post(Uri.parse(url),headers: {
      "content-type": "application/json",
    },
        body: json.encode({
          "email":user!.email,
          "password":user!.password,
        })
    );
    print(res.body);
    final userData = json.decode(res.body);
    final connectedUser = User.fromJson(userData);
    print(userData.runtimeType);
    print("ahooooooooo ${connectedUser.email}");
    _saveUser(connectedUser.email, connectedUser.password, connectedUser.role!);
  }


  _saveUser(String email, String password, String role) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
    prefs.setString('password', password);
    prefs.setString('role', role);
  }

  static  _getUser() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'email': prefs.getString('email'),
      'password': prefs.getString('password'),
      'role': prefs.getString('role'),
    };
  }




  Future<User> getUser(int id) async {
    print('enterrrrrrrrrrrr');
    final response = await http.get(Uri.parse("http://10.0.2.2:8080/user/get/$id"));
    if (response.statusCode == 200) {
      print("okkkkk");
      print (User.fromJson(jsonDecode(response.body)));
      return User.fromJson(jsonDecode(response.body));

    } else {
      throw Exception('Failed to get user');
    }
  }
  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        print("enter try");
        var url = "http://10.0.2.2:8080/user/getUser/41";
        Uri uri = Uri.parse(url);

        var user = User(email: _email!,password: _password!,role: "patient", nom: '', prenom: '', telephone: '');
        final response = await http.get(
          uri,
          // body:{
          //   // "email":"ak@gmail.com",
          //   // "password":"akakak",
          //   // "role":"patient"
          // }
          //body: user,
        );
        print("aaaaaaaaaaaaaaaaaa");
        final responseData = json.decode(response.body);
        print(responseData);
        if(response.statusCode ==200){
          print("succees");
          _saveUser(_email!, _password!, "adefinir");
        }
        else{
          print("failed to connect");
        }

      } catch (e) {
        print("erreur!!! $e");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerScreen(),
        appBar: AppBar(title:Text("Connexion"),centerTitle: true,),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
          margin: const EdgeInsets.fromLTRB(20.0,200.0,20.0,0.0),
          height: 500.0,
          width: 500.0,
          color: Colors.grey[200],
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      "http://cabinetmedicalbleeckxaujoulat.be/wp-content/uploads/2014/02/logo-cabinet.jpg",
                      scale: 3.5,
                      height: 45,
                      opacity: AlwaysStoppedAnimation(0.5),
                    ),
                    Image.network(
                      "http://cabinetmedicalbleeckxaujoulat.be/wp-content/uploads/2014/02/logo-cabinet.jpg",
                      height: 100,
                      width: 100,
                    ),
                    TextFormField(
                      controller: TextEditingController(text: user!.email),
                      onChanged: (val){
                        user!.email = val;
                      },
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Merci de taper votre email';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value,
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: TextEditingController(text: user!.password),
                      onChanged: (val){
                        user!.password = val;
                      },
                      decoration: InputDecoration(labelText: 'Mot de passe'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Merci de taper votre mot de passe";
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value,
                      obscureText: true,
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        SizedBox(
                          width: 140.0,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[700]
                            ),
                            child: Text('Se connecter'),
                            onPressed: ()async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                // Add code to authenticate user and log them in

                                save();
                                print("votre email est : $_email");
                                print("votre mot de passe est : $_password");
                              }
                            },
                          ),
                        ),
                        const SizedBox( width: 12.0,),
                        SizedBox(
                          width:140.0,
                          child: ElevatedButton(

                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[700]
                            ),
                            child: Text('Non inscrit !'),
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignUpPage()) );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}