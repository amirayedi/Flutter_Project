import 'package:flutter/material.dart';
import 'package:flutterproject/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginPage.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //const ProfilePage({Key? key,}) : super(key: key);

  @override
  void initState() {
    _getUser();
    super.initState();
  }


  var email;

  var role;

  var password;

  var _user;

  _getUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _user = {
        'email': prefs.getString('email'),
        'password': prefs.getString('password'),
        'role': prefs.getString('role'),
      };
    });
    //  email = prefs.get("email");
    //  role = prefs.get("role");
    //  password = prefs.get("password");
    //  print(role);
    // return {
    //   'email': prefs.getString('email'),
    //   'password': prefs.getString('password'),
    //   'role': prefs.getString('role'),
    // };
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: DrawerScreen(),
      appBar:AppBar(title: const Text("Profil")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top:10,left: 15.0, right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child:  CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/user.png'),
                ),
              ),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("fName",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(width: 6),
                Text("lName",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
              ]),
              const SizedBox(height: 6),
              Center(
                child: Text(
                  _user !=null ? "${_user["email"]}" : "ereeeeeeeur",
                  style: TextStyle(color: Colors.grey.shade800),
                ),
              ),
              const SizedBox(height: 60),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const Text('Username: ',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("${_user["email"]}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400)),
                ],
              ),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Age: ',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("dob.toString()",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text(
                    ''
                        'Gender: ',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("gender.toString()",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Phone Number: ',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("phoneNumber.toString()",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Country: ',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("country.toString()",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
              const SizedBox(height: 25),
              Row(children: [
                const Text('Registered: ',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("registeredOn.toString()",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400))
              ]),
            ],
          ),
        ),
      ),
    );
  }
}