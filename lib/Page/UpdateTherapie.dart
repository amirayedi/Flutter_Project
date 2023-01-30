import 'package:flutter/material.dart';
import 'package:flutterproject/Model/Therapie.dart';
import 'package:flutterproject/Service/TherapieService.dart';


class UpdateTherapie extends StatefulWidget {
  Therapie? therapie;
  UpdateTherapie({Key? key, this.therapie}): super(key: key);
  @override
  _UpdateTherapiePage createState() => _UpdateTherapiePage(therapie);
}

class _UpdateTherapiePage extends State<UpdateTherapie>
    with AutomaticKeepAliveClientMixin<UpdateTherapie> {

  TherapieService therapieService = new TherapieService();
  Therapie? therapie;
  _UpdateTherapiePage(this.therapie);
  @override
  void initState() {
    super.initState();
  }

  final newNom = TextEditingController();
  final newDescription = TextEditingController();



  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Therapie"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                    controller: newNom,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nom",
                      hintText: this.therapie!.nom,
                    ),
                    onChanged: (newNom) {
                      if (newNom.isNotEmpty) {
                        this.therapie!.nom=newNom;
                      }
                    }
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                    controller: newDescription,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Prenom",
                      hintText: this.therapie!.description,
                    ),
                    onChanged: (newDescription) {
                      if (newDescription.isNotEmpty) {
                        this.therapie!.description=newDescription;
                      }
                    }
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[

                    TextButton(
                        child: Text('Submit'),
                        onPressed: () => {
                          therapieService.updateTherapie(this.therapie!.id,this.therapie!)

                        }
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  bool get wantKeepAlive => true;
}
