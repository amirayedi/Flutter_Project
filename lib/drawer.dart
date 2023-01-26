import 'package:flutter/material.dart';
import 'package:flutterproject/Page/GestionSecretaire.dart';
import 'package:flutterproject/Page/Email.dart';
import 'package:flutterproject/Page/Profil.dart';
import 'package:flutterproject/Page/GestionTherapie.dart';
import 'package:flutterproject/Page/RendezVous.dart';


class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.blue[50],
      ),
      child: Drawer(
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.blueGrey,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                ),
                title: Text(
                  'Joaquin Phoenix',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                subtitle: Text(
                  "You wouldn't get it",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 10.0),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                leading : const Icon( Icons.account_box),
                title: const Text('Profil'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  ProfilePage()),
                  );
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                leading : const Icon( Icons.list),
                title: const Text('Gestion Secretaire'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  GestionSecretaire()),
                  );
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                leading : const Icon( Icons.description ),
                title: const Text('Gestion thérapie'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  GestionTherapie()),
                  );

                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                leading : const Icon( Icons.history),
                title: const Text('Historique'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                leading : const Icon( Icons.markunread),
                title: const Text('Email'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  EmailPage()),
                  );
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                leading : const Icon( Icons.calendar_today),
                title: const Text('Appointment'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  RendezVous()),
                  );
                },
              ),
            ],
          )
      ),
    );
  }
}