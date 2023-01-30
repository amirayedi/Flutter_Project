import 'package:flutter/material.dart';
import 'package:flutterproject/Model/RendezVous.dart';
import 'package:flutterproject/Service/PatientService.dart';

class GererRdvPage extends StatefulWidget {
  @override
  _GererRdvPageState createState() => _GererRdvPageState();
}
class _GererRdvPageState extends State<GererRdvPage>
    with AutomaticKeepAliveClientMixin<GererRdvPage> {
  PatientService patientService = new PatientService();


  Future<List<RendezVous>>? rendezVous;



  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {

    rendezVous = patientService.getAllRDV();
    setState(() {
    });

  }

  List<String> items = ["Aimir ayedi", "Mahdi Menaa", "OUSEMA Hamemmi"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Secretaires")),
      body: Container(
        child: FutureBuilder<List<RendezVous>>(
            future: rendezVous,
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
                                   /* Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  UpdateSecretaire(user : snapshot.data![index])),
                                    );*/
                                  },
                                  child: Text("Modifier"),
                                ),
                                SizedBox(width: 10),
                                // add space between buttons
                                TextButton(
                                  onPressed: () {
                                  //  userService.deleteUser(snapshot.data![index].id);
                                  },
                                  child: Text("Supprimer"),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
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