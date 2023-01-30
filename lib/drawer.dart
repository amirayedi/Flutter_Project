/*import 'package:flutter/material.dart';
import 'package:flutterproject/Page/GestionSecretaire.dart';
import 'package:flutterproject/Page/GererRdvPage.dart';
import 'package:flutterproject/Page/Profil.dart';
import 'package:flutterproject/Page/GestionTherapie.dart';
import 'package:flutterproject/Page/Rendezvous.dart';


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
                title: const Text('Gérer Rendez-Vous'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  GererRdvPage()),
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
                    MaterialPageRoute(builder: (context) =>  Rendezvous()),
                  );
                },
              ),
            ],
          )
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutterproject/Page/GestionSecretaire.dart';
import 'package:flutterproject/Page/GererRdvPage.dart';
import 'package:flutterproject/Page/Profil.dart';
import 'package:flutterproject/Page/GestionTherapie.dart';
import 'package:flutterproject/Page/loginPage.dart';
import 'package:flutterproject/Page/Rendezvous.dart';

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
                  'Non connecté',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                subtitle: Text(
                  "Bienvenu dans notre cabinet",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 10.0),
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                leading : const Icon( Icons.login_outlined),
                title: const Text("Se connecter"),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  LoginPage()),
                  );
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                leading : const Icon( Icons.account_box),
                title: const Text('Profil'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  ProfilePage()),
                  );
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                leading : const Icon( Icons.list),
                title: const Text('Gestion des secretaires'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  GestionSecretaire()),
                  );
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                leading : const Icon( Icons.description ),
                title: const Text('Gestion des thérapies'),
                onTap: () {
                  Navigator.pushReplacement(
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
                title: const Text('Gerer Rdv'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  GererRdvPage()),
                  );
                },
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30.0),
                leading : const Icon( Icons.calendar_today),
                title: const Text('Appointment'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  Rendezvous()),
                  );
                },
              ),
            ],
          )
      ),
    );
  }
}