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

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: 200, // Replace with your desired width
            height: 200, // Replace with your desired height
            child: Container(
              color: Colors.blue,
              child: GestureDetector(
                onTap: () => printConnection(),
              ),
            ),
          ),
        ],
      ),
    );
}
}
