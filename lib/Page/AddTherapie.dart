import 'package:flutter/material.dart';
import 'package:flutterproject/Model/Therapie.dart';
import 'package:flutterproject/Service/TherapieService.dart';


class AddTherapie extends StatefulWidget {

  AddTherapie({Key? key}): super(key: key);
  @override
  _AddTherapiePage createState() => _AddTherapiePage();
}

class _AddTherapiePage extends State<AddTherapie>
    with AutomaticKeepAliveClientMixin<AddTherapie> {

  TherapieService therapieService = new TherapieService();
  Therapie therapie = new Therapie(nom: '', description: '', image: '');
  _AddTherapiePage();

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
        title: const Text("Add Therapie"),
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
                    ),
                    onChanged: (newNom) {
                      if (newNom.isNotEmpty) {
                        this.therapie.nom=newNom;
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
                      labelText: "Description",
                    ),
                    onChanged: (newDescription) {
                      if (newDescription.isNotEmpty) {
                        this.therapie.description=newDescription;
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

                          therapieService.addtherapie(this.therapie!)
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
