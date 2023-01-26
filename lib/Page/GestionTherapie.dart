
import 'package:flutter/material.dart';

class GestionTherapie extends StatelessWidget {
  GestionTherapie({Key? key}) : super(key: key);



  List<String> items =["Aimir ayedi", "Mahdi Menaa", "OUSEMA Hamemmi"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Thearpies")),
      body: Column(
        children: [
          Expanded(child:
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(items[index]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        // code to execute when first button is pressed
                      },
                      child: Text("Modifier"),
                    ),
                    SizedBox(width: 10), // add space between buttons
                    TextButton(
                      onPressed: () {
                        // code to execute when second button is pressed
                      },
                      child: Text("Supprimer"),
                    ),
                  ],
                ),
              );
            },
          ),
          ),
          TextButton(
            child: Text('Ajouter'),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}



