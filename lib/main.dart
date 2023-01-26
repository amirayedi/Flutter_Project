import 'package:flutter/material.dart';
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
}