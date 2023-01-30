import 'package:flutter/material.dart';
import 'package:flutterproject/Model/User.dart';
import 'package:flutterproject/Service/UserService.dart';


class AddSecretaire extends StatefulWidget {

  AddSecretaire({Key? key}): super(key: key);
  @override
  _AddSecretairePage createState() => _AddSecretairePage();
}

class _AddSecretairePage extends State<AddSecretaire>
    with AutomaticKeepAliveClientMixin<AddSecretaire> {

  UserService userService = new UserService();
  User user = new User(nom: '', email: '', prenom: '', telephone: '', password: '', role: 's');
  _AddSecretairePage();

  @override
  void initState() {
    super.initState();
  }

  final newNom = TextEditingController();
  final newPrenom = TextEditingController();
  final newEmail = TextEditingController();
  final newPassword = TextEditingController();
  final newTelephone = TextEditingController();


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Secretaire"),
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
                        this.user.nom=newNom;
                      }
                    }
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                    controller: newPrenom,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Prenom",
                    ),
                    onChanged: (newPrenom) {
                      if (newPrenom.isNotEmpty) {
                        this.user.prenom=newPrenom;
                      }
                    }
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                    controller: newEmail,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                    ),
                    onChanged: (newEmail) {
                      if (newEmail.isNotEmpty) {
                        this.user.email=newEmail;
                      }
                    }
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                    controller: newPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                    ),
                    onChanged: (newPassword) {
                      if (newPassword.isNotEmpty) {
                        this.user.password=newPassword;
                      }
                    }
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                    controller: newTelephone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Telephone",
                    ),
                    onChanged: (newTelephone) {
                      if (newTelephone.isNotEmpty) {
                        this.user.telephone=newTelephone;
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
                          print(this.user),
                          userService.addUser(this.user!)
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
