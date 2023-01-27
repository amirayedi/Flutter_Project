
import 'package:flutter/material.dart';
import 'package:flutterproject/Model/User.dart';
import 'package:flutterproject/Service/SecretairesService.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GestionSecretaire extends StatefulWidget {
  @override
  _GestionSecretairePage createState() => _GestionSecretairePage();
}
class _GestionSecretairePage extends State<GestionSecretaire>
    with AutomaticKeepAliveClientMixin<GestionSecretaire> {
  SecretaireService secretaireService = new SecretaireService();

  Future<List<User>>? user;
  List<User> users= [];



  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    user = (await secretaireService.getAllUser()) as Future<List<User>>?;
  }

  List<String> items = ["Aimir ayedi", "Mahdi Menaa", "OUSEMA Hamemmi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            title: Text(snapshot.data![index].lastName),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    // code to execute when first button is pressed
                                  },
                                  child: Text("Modifier"),
                                ),
                                SizedBox(width: 10),
                                // add space between buttons
                                TextButton(
                                  onPressed: () {
                                    // code to execute when second button is pressed
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
                      onPressed: () => {},
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


