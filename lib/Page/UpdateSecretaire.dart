import 'package:flutter/material.dart';
import 'package:flutterproject/Model/User.dart';
import 'package:flutterproject/Service/UserService.dart';
import 'package:flutterproject/Service/UserService.dart';


class UpdateSecretaire extends StatefulWidget {
  User? user;
  UpdateSecretaire({Key? key, this.user}): super(key: key);
  @override
  _UpdateSecretairePage createState() => _UpdateSecretairePage(user);
}

class _UpdateSecretairePage extends State<UpdateSecretaire>
    with AutomaticKeepAliveClientMixin<UpdateSecretaire> {

  UserService userService = new UserService();

  User? user;
  _UpdateSecretairePage(this.user);
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
        title: const Text("Update Secretaire"),
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
                    hintText: this.user!.nom,
                  ),
                    onChanged: (newNom) {
                      if (newNom.isNotEmpty) {
                        this.user!.nom=newNom;
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
                    hintText: this.user!.prenom,
                  ),
                    onChanged: (newPrenom) {
                      if (newPrenom.isNotEmpty) {
                        this.user!.prenom=newPrenom;
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
                    hintText: this.user!.email,
                  ),
                    onChanged: (newEmail) {
                      if (newEmail.isNotEmpty) {
                        this.user!.email=newEmail;
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
                    hintText: this.user!.password,
                  ),
                    onChanged: (newPassword) {
                      if (newPassword.isNotEmpty) {
                        this.user!.password=newPassword;
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
                    hintText: this.user!.telephone,
                  ),
                    onChanged: (newTelephone) {
                      if (newTelephone.isNotEmpty) {
                        this.user!.telephone=newTelephone;
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
                      //secretaireService.updateSecretaire(this.secretaire!.id,this.secretaire!)
                      userService.updateUser(this.user!.id,this.user!)
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
