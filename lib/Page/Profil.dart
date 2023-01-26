import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                  "email",
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
                  Text("userName.toString()",
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