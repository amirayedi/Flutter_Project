import 'package:flutter/material.dart';
import 'package:flutterproject/Model/RendezVous.dart';
import 'package:flutterproject/Service/PatientService.dart';


import 'package:flutterproject/Service/TherapieService.dart';
import 'package:flutterproject/Model/Therapie.dart';
import 'package:flutterproject/drawer.dart';


class Rendezvous extends StatefulWidget {

@override
_RendezVousState createState() => _RendezVousState();
}


class _RendezVousState extends State<Rendezvous>
  with AutomaticKeepAliveClientMixin<Rendezvous> {

  TherapieService therapieService = new TherapieService();

  PatientService patientService = new PatientService();

  final newNom = TextEditingController();
  final newPrenom = TextEditingController();
  final newEmail = TextEditingController();
  final newPassword = TextEditingController();
  final newTelephone = TextEditingController();

  RendezVous rendezVous = new RendezVous(nom: '', prenom: '', email: '', telephone: '', therapie: '', temps1: '', arrivee: '');
  List<Therapie>? therapie;

  final listTherapie =[''] ;
  String? therapy;

  @override
  void initState() {
  super.initState();
  getUser();
  }

  void getUser() async {
  therapie= await therapieService.getAllTherapie();
  for (var s in therapie!) {
    listTherapie.add(s.nom);
  }
  setState(() {
  });

  }

  DateTime dateTime = new DateTime.now();
  @override
          Widget build(BuildContext context) {

          return Scaffold(drawer: DrawerScreen(),
          appBar: AppBar(title: const Text("Appointment")),
          body:Column(
          children: [
          const SizedBox(width: 16),
          Padding(
              padding: EdgeInsets.only(top:10,left: 44.0, right: 44),
              child: TextField(
                controller: newNom,
              decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
              ),
                  onChanged: (newNom) {
                    if (newNom.isNotEmpty) {
                      this.rendezVous.nom=newNom;
                    }
                  }
              ),
          ),
            Padding(
              padding: EdgeInsets.only(top:10,left: 44.0, right: 44),
              child: TextField(
                controller: newPrenom,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Prenom',
                ),
                  onChanged: (newPrenom) {
                    if (newPrenom.isNotEmpty) {
                      this.rendezVous.prenom=newPrenom;
                    }
                  }
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10,left: 44.0, right: 44),
              child: TextField(
                  controller: newEmail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                  onChanged: (newEmail) {
                    if (newEmail.isNotEmpty) {
                      this.rendezVous.email=newEmail;
                    }
                  }
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10,left: 44.0, right: 44),
              child: TextField(
                  controller: newTelephone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Telephone',
                ),
                  onChanged: (newTelephone) {
                    if (newTelephone.isNotEmpty) {
                      this.rendezVous.telephone=newTelephone;
                    }
                  }
              ),
            ),
          Container(
              width: 400,
              child:DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: "-therapie",
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(width: 3,color: Colors.blue),
                  ),
                ),
                value: therapy,
                items: listTherapie.map(buildMenuItemSector).toList(),
                onChanged: (value)=>setState(() {this.therapy=value;
                this.rendezVous.therapie=this.therapy! ;
                onChange();}),
              ),

          ),
            const SizedBox(height: 16),
             Row(

          children: <Widget>[
              const SizedBox(width: 47),
              Text("${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour}:${dateTime.minute}"),
              const SizedBox(width: 110),
              TextButton(
            onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: dateTime,
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2100),
                  );
          if (newDate == null) return ;
              TimeOfDay? newTime = await showTimePicker(
              context: context,
              initialTime: TimeOfDay(
              hour: dateTime.hour,
              minute: dateTime.minute),
          );
            if (newTime == null) return ;
                final newDateTime = DateTime(
                newDate.year,
                newDate.month,
                newDate.day,
                newTime.hour,
                newTime.minute,
                );
                setState(() {
                dateTime=newDateTime;
                this.rendezVous.temps1=dateTime.toString();
                });
          },
            child: Text(
            'Choose Date',
            style: TextStyle(color: Colors.blue),
            )),
            ],
            ),
              const SizedBox(height: 36),
              TextButton(
              child: Text('Submit'),
              onPressed: () {
              patientService.addRDV(this.rendezVous);
              },
              ),
          ],
          ),
          );
  }

  DropdownMenuItem<String> buildMenuItemSector (String therapy) => DropdownMenuItem (
    value: therapy,
    child: Text(
      therapy ,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,

      ),
    ),
  );

  void onChange() async {

  }



  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  }

