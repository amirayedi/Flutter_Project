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
        nom: ("musicoth??rapie "),
        description:
        "Tr??s en vogue depuis quelques ann??es, la musicoth??rapie a la particularit?? d???utiliser la musique comme moyen th??rapeutique. Dans cette fiche, vous d??couvrirez ce qu???est la musicoth??rapie en d??tail, ses principes, son histoire, ses bienfaits, comment se d??roule une s??ance, et comment se former en musicoth??rapie.",
        image:
        "https://img.passeportsante.net/1200x675/2021-04-21/i101504-.webp"),
    Therapie(
        nom: ("Le yoga des yeux "),
        description:
        "Le yoga des yeux consiste en une s??rie d???exercices ?? faire seul ou groupe et permettant de lutter contre la fatigue oculaire??? de plus en plus pr??sente du fait de la surexposition aux ??crans.",
        image:
        "https://img.passeportsante.net/1200x675/2021-04-21/i101510-.webp"),
    Therapie(
        nom: "Massage tha??landais",
        description:
        "Venu de l???Inde, influenc?? par le bouddhisme, ayurv??da et la M??decine traditionnelle chinoise, le massage tha??landais s???inscrit dans la grande famille de la massoth??rapie. Dans cette fiche, vous d??couvrirez ce massage plus en profondeur, ses principes, son histoire, ses bienfaits, comment il se pratique et par qui, et enfin, les contre-indications.",
        image:
        "https://img.passeportsante.net/1200x675/2021-04-21/i101519-.webp"),
    Therapie(
        nom: "Massoth??rapie",
        description:
        "Telle qu???on la conna??t aujourd???hui, la massoth??rapie a simplement ??t?? perfectionn??e, raffin??e, et modernis??e afin que le toucher devienne une approche plus structur??e.nfin, l???avis de sp??cialistes de cette technique th??rapeutique.",
        image:
        "https://img.passeportsante.net/1200x675/2021-05-03/i105590-massotherapie-th.webp"),
    Therapie(
        nom: "Drainage lymphatique manuel",
        description:
        "Le drainage lymphatique manuel est une technique de massage doux destin??e ?? stimuler la circulation de la lymphe et ?? d??toxiquer l'organisme, tout en renfor??ant le syst??me immunitaire. Il s???effectue avec les doigts et la paume des mains sur l'ensemble du corps.",
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
                    "Notre cabinet est votre lieu o?? des professionnels qualifi??s (psychologues, psychoth??rapeutes, etc.) offrent des services de conseil et de traitement pour aider les gens ?? r??soudre des probl??mes de sant?? mentale et ??motionnelle. Les th??rapies peuvent inclure des approches individuelles, en couple ou en groupe pour traiter des probl??mes tels que la d??pression, l'anxi??t??, le trouble de stress post-traumatique (TSPT), les relations interpersonnelles, etc. Les th??rapies sont personnalis??es en fonction des besoins et des objectifs de chaque patient.",
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