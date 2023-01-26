import 'package:flutter/material.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Email")),
      body: /*TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'email@example.com',
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Please enter an email';
          }
          if (!RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
              .hasMatch(value)) {
            return 'Please enter a valid email';
          }
          return null;
        },
        onSaved: (String? value) {
          var _email = value;
        },
      ),*/Column(
          children: [
          Padding(
           padding: EdgeInsets.all(8.0),
           child: TextField(

           decoration: InputDecoration(
            border: OutlineInputBorder(),
           labelText: 'Recipient',
           ),
           ),
          ),
         Padding(
         padding: EdgeInsets.all(8.0),
           child: TextField(

              decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Subject',
             ),
            ),
          ),
           Expanded(
             child: Padding(
                  padding: EdgeInsets.all(8.0),
                   child: TextField(

                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                  labelText: 'Body', border: OutlineInputBorder()),
                ),
               ),
              ),
              Padding(
              padding: EdgeInsets.all(8.0),
                child: Column(
                children: <Widget>[

                  TextButton(
                    child: Text('Submit'),
                onPressed: () => {},
                  ),
                 ],
                ),
              ),
          ],
      ),
    );
  }
}