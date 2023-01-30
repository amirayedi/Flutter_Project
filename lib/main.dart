/*import 'package:flutter/material.dart';
import 'drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            drawer: DrawerScreen(),
            appBar: PreferredSize(
                child: Container(
                  color: Colors.white,
                  padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Builder(
                        builder: (context) =>
                            GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: Icon(Icons.menu)),
                      ),
                      Text(
                        'Appbar',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.search)
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(40)),
            backgroundColor: Colors.blueGrey,
            body: Center(
              child: Text('Experimenting drawer'),
            )));
  }
}*/
import 'package:flutter/material.dart';
import 'Model/Therapie.dart';
import 'drawer.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Therapie> therapies = [
    Therapie(
        nom: ("musicothérapie "),
        description:
        "Très en vogue depuis quelques années, la musicothérapie a la particularité d’utiliser la musique comme moyen thérapeutique. Dans cette fiche, vous découvrirez ce qu’est la musicothérapie en détail, ses principes, son histoire, ses bienfaits, comment se déroule une séance, et comment se former en musicothérapie.",
        image:
        "https://img.passeportsante.net/1200x675/2021-04-21/i101504-.webp"),
    Therapie(
        nom: ("Le yoga des yeux "),
        description:
        "Le yoga des yeux consiste en une série d’exercices à faire seul ou groupe et permettant de lutter contre la fatigue oculaire… de plus en plus présente du fait de la surexposition aux écrans.",
        image:
        "https://img.passeportsante.net/1200x675/2021-04-21/i101510-.webp"),
    Therapie(
        nom: "Massage thaïlandais",
        description:
        "Venu de l’Inde, influencé par le bouddhisme, ayurvéda et la Médecine traditionnelle chinoise, le massage thaïlandais s’inscrit dans la grande famille de la massothérapie. Dans cette fiche, vous découvrirez ce massage plus en profondeur, ses principes, son histoire, ses bienfaits, comment il se pratique et par qui, et enfin, les contre-indications.",
        image:
        "https://img.passeportsante.net/1200x675/2021-04-21/i101519-.webp"),
    Therapie(
        nom: "Massothérapie",
        description:
        "Telle qu’on la connaît aujourd’hui, la massothérapie a simplement été perfectionnée, raffinée, et modernisée afin que le toucher devienne une approche plus structurée.nfin, l’avis de spécialistes de cette technique thérapeutique.",
        image:
        "https://img.passeportsante.net/1200x675/2021-05-03/i105590-massotherapie-th.webp"),
    Therapie(
        nom: "Drainage lymphatique manuel",
        description:
        "Le drainage lymphatique manuel est une technique de massage doux destinée à stimuler la circulation de la lymphe et à détoxiquer l'organisme, tout en renforçant le système immunitaire. Il s’effectue avec les doigts et la paume des mains sur l'ensemble du corps.",
        image:
        "https://img.passeportsante.net/1200x675/2021-05-03/i105546-drainage-lymphatique-th.webp"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            drawer: DrawerScreen(),
            appBar: PreferredSize(
                child: Container(
                  color: Colors.white,
                  padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Builder(
                        builder: (context) => GestureDetector(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: Icon(Icons.menu)),
                      ),
                      Text(
                        'Appbar',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.search)
                    ],
                  ),
                ),
                preferredSize: Size.fromHeight(40)),
            backgroundColor: Colors.grey[300],
            body: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.all(20.0),
                  color: Colors.amber[100],
                  child: Text(
                    "Notre cabinet est votre lieu où des professionnels qualifiés (psychologues, psychothérapeutes, etc.) offrent des services de conseil et de traitement pour aider les gens à résoudre des problèmes de santé mentale et émotionnelle. Les thérapies peuvent inclure des approches individuelles, en couple ou en groupe pour traiter des problèmes tels que la dépression, l'anxiété, le trouble de stress post-traumatique (TSPT), les relations interpersonnelles, etc. Les thérapies sont personnalisées en fonction des besoins et des objectifs de chaque patient.",
                    style: GoogleFonts.lato(fontStyle: FontStyle.italic),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: therapies.length,
                      itemBuilder: (context, i) {
                        return Container(
                          height: 300.0,
                          child: Card(
                            color: Colors.amber[500],elevation: 20.0,
                            margin: EdgeInsets.all(15.0),
                            shape: Border(bottom: BorderSide(width: 10,color: Colors.grey)),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: ListTile(
                                focusColor: Colors.amber,
                                leading: Image.network(therapies[i].image!),
                                title: SingleChildScrollView(child: Text(therapies[i].nom!)),
                                subtitle: Text(therapies[i].description!),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            )));
  }
}