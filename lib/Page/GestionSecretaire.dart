
import 'package:flutter/material.dart';
import 'package:flutterproject/Model/User.dart';
import 'package:flutterproject/Page/AddSecretaire.dart';
import 'package:flutterproject/Page/UpdateSecretaire.dart';
import 'package:flutterproject/Service/UserService.dart';
import 'package:flutterproject/drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GestionSecretaire extends StatefulWidget {
  @override
  _GestionSecretairePage createState() => _GestionSecretairePage();
}
class _GestionSecretairePage extends State<GestionSecretaire>
    with AutomaticKeepAliveClientMixin<GestionSecretaire> {


  UserService userService = new UserService();


  Future<List<User>>? user;



  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {

    user = userService.getAllSecretaire();
    setState(() {
    });

  }

  List<String> items = ["Aimir ayedi", "Mahdi Menaa", "OUSEMA Hamemmi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(title: const Text("List Secretaires")),
      body: Container(
        child: FutureBuilder<List<User>>(
            future: user,
            builder: (context, snapshot){
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(snapshot.data![index].nom),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  UpdateSecretaire(user : snapshot.data![index])),
                                    );
                                  },
                                  child: Text("Modifier"),
                                ),
                                SizedBox(width: 10),
                                // add space between buttons
                                TextButton(
                                  onPressed: () {
                                    userService.deleteUser(snapshot.data![index].id);
                                  },
                                  child: Text("Supprimer"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    TextButton(
                      child: Text('Ajouter'),
                      onPressed: () => {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  AddSecretaire()),
                      ),
                      },
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return CircularProgressIndicator();
              }
            }),
        ),
      );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}


