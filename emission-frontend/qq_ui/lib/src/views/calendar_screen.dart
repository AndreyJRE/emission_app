import 'package:flutter/material.dart';
import 'package:qq_ui/src/router/connection.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({
    super.key,
  });

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  var _selectedDay;
  var _focusedDay;
  String selectedValue = 'BIKE_ELECTRIC';
  String output = '1';

  Widget build(BuildContext context) {

    final items = ['WALK', 'BIKE', 'BIKE_ELECTRIC', 'CAR_DIESEL', 'CAR_BENZIN', 'CAR_ELECTRIC', 'BUS', 'TRAIN_SHORT', 'TRAIN_LONG', 'AIRPLANE'];
    return 
    Row(children: [SizedBox(width: 20),
    Column(children: [
      Image.asset(
            '/images/LogoApp.png'
            ,width: 200, 
            height: null,), 
      Text('Insert your activity data: ', style: TextStyle(fontSize: 24)), 
      SizedBox(height: 8), 

      Container(
        child: DropdownButton<String>(
          value: selectedValue,
          items: <String>[
            'WALK', 
            'BIKE', 
            'BIKE_ELECTRIC', 
            'CAR_DIESEL', 
            'CAR_BENZIN', 
            'CAR_ELECTRIC', 
            'BUS', 
            'TRAIN_SHORT', 
            'TRAIN_LONG', 
            'AIRPLANE'
          ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value, 
            style: TextStyle(fontSize: 22),),
        );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue ?? 'WALK'; // Providing default value if newValue is null
        });
        },
      ),
      ), 
      SizedBox(height: 8), 
      Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
            border: Border.all(color: Colors.black), // Add a black border
            borderRadius: BorderRadius.circular(10), // Optional: Add rounded corners
            ),
            width: 270, 
            child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter distance here', // Placeholder text
            ),
          )
      ), 
      SizedBox(height: 8),
      Text('Calculated CO2 output: ', style: TextStyle(fontSize: 24)), 
      Text(output, style: TextStyle(fontSize: 24)),
    ],)],);
}
}
