import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:table_calendar/table_calendar.dart';

class RendezVous extends StatefulWidget {

@override
_RendezVousState createState() => _RendezVousState();
}


class _RendezVousState extends State<RendezVous> {

  
  DateTime dateTime = new DateTime.now();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text("Appointment")),
      body:Column(
        children: [
          const SizedBox(width: 16),
             Padding(
            padding: EdgeInsets.only(top:10,left: 44.0, right: 44),
            child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
          ),
        ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top:10,left: 44.0, right: 44),
              child: TextField(
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                    labelText: 'Symptomes', border: OutlineInputBorder()),
              ),
            ),
          ),
          Container(
            width: 400,
            child:DropdownButton<String>(
            // value: "dropdownvalue",
            icon:  Icon(Icons.keyboard_arrow_down),
            items: [
              DropdownMenuItem(
                child: Text('Service 1'),
                value: 'service1',
              ),
              DropdownMenuItem(
                child: Text('Service 2'),
                value: 'service2',
              ),
            ],
            onChanged: (value) {
              // Save the selected value to a variable
            },
          ),
          ),
          const SizedBox(height: 16),
          Row(

          children: <Widget>[
            const SizedBox(width: 47),
            Text("${dateTime.day}/${dateTime.month}/${dateTime.year} - ${dateTime.hour}:${dateTime.minute}"),
            const SizedBox(width: 180),
            TextButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: dateTime,
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2100),
                  );
                  if (newDate == null) return ;
                  TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay(
                        hour: dateTime.hour,
                        minute: dateTime.minute),
                  );
                  if (newTime == null) return ;
                  final newDateTime = DateTime(
                    newDate.year,
                    newDate.month,
                    newDate.day,
                    newTime.hour,
                    newTime.minute,
                  );
                  setState(() {
                    dateTime=newDateTime;
                  });
                },
                child: Text(
                  'Choose Date',
                  style: TextStyle(color: Colors.blue),
                )),
                ],
          ),
          const SizedBox(height: 36),
                  TextButton(
                    child: Text('Submit'),
                    onPressed: () {
                      // Send the appointment request
                    },
                  ),
        ],
      ),
    );
  }
}