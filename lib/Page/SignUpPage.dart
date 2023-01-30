import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutterproject/drawer.dart';

import '../Model/User.dart';
import 'loginPage.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  User? user =User(email: "",password: "", nom: '', prenom: '', telephone: '', role: '');
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _repassword;
  String? _tel;
  String? _nom;
  String? _prenom;

  String url = "http://10.0.2.2:8080/user/createUser";
  Future save() async{
    var res = await http.post(Uri.parse(url),headers: {
      "content-type": "application/json",
    },
        body: json.encode({
          "id":"",
          "email":_email,
          "password":_password,
          "telephone":_tel,
          "nom":_nom,
          "prenom":_prenom,
          "role":"patient"
        })
    );
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerScreen(),
        appBar: AppBar(title: Text("Inscription"),centerTitle: true,),
        body: Container(
          padding: const EdgeInsets.fromLTRB(20.0,20.0,20.0,0.0),
          margin: const EdgeInsets.fromLTRB(20.0,150.0,20.0,0.0),
          height: 600.0,
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
                    //const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nom'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Merci de taper votre nom';
                        }
                        return null;
                      },
                      onSaved: (value) => _nom = value,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Prénom'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Merci de taper votre prénom';
                        }
                        return null;
                      },
                      onSaved: (value) => _prenom = value,
                    ),
                    SizedBox(height: 16.0,),
                    TextFormField(
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
                    SizedBox(height: 16.0),
                   /* TextFormField(
                      decoration: InputDecoration(labelText: 'Valider mot de passe'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Merci de retaper votre mot de passe";
                        }
                        if(value!=_password){
                          return "Merci de retaper le mot de passe correctement";
                        }
                        return null;
                      },
                      onSaved: (value) => _repassword = value,
                      obscureText: true,
                    ),
                    const SizedBox(height: 16.0),*/
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Téléphone'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Merci de taper votre téléphone';
                        }
                        return null;
                      },
                      onSaved: (value) => _tel = value,
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        SizedBox(
                          width: 140,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[700]
                            ),
                            child: Text("S'inscrire"),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                save();
                                // Add code to authenticate user and log them in
                                print("votre email est : $_email");
                                print("votre mot de passe est : $_password");
                              }
                            },
                          ),
                        ),
                        const SizedBox( width: 10.0,),
                        SizedBox(
                          width: 140,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[700]
                            ),
                            child: Text('Déjà inscrit !'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  LoginPage()),
                              );
                              //Navigator.pushNamed(context, "/login" );
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