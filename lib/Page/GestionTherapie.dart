
import 'package:flutter/material.dart';
import 'package:flutterproject/Model/Therapie.dart';
import 'package:flutterproject/Page/AddTherapie.dart';
import 'package:flutterproject/Page/UpdateTherapie.dart';
import 'package:flutterproject/Service/TherapieService.dart';
import 'package:flutterproject/drawer.dart';

class GestionTherapie extends StatefulWidget {
  @override
  _GestionTherapiePage createState() => _GestionTherapiePage();
}

class _GestionTherapiePage extends State<GestionTherapie>
    with AutomaticKeepAliveClientMixin<GestionTherapie> {

  TherapieService therapieService = new TherapieService();

  Future<List<Therapie>>? therapie;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    therapie= therapieService.getAllTherapie();
    setState(() {
    });

  }



  List<String> items =["Aimir ayedi", "Mahdi Menaa", "OUSEMA Hamemmi"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerScreen(),
      appBar: AppBar(title: const Text("List Thearpies")),
      body: Container(
        child: FutureBuilder<List<Therapie>>(
            future: therapie,
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
                                      MaterialPageRoute(builder: (context) =>  UpdateTherapie(therapie : snapshot.data![index])),
                                    );
                                  },
                                  child: Text("Modifier"),
                                ),
                                SizedBox(width: 10),
                                // add space between buttons
                                TextButton(
                                  onPressed: () {
                                    therapieService.deletetherapie(snapshot.data![index].id);
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
                          MaterialPageRoute(builder: (context) =>  AddTherapie()),
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




