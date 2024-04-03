import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qq_ui/listeners/emissionValut.dart';
import 'package:qq_ui/src/router/ActivityType.dart';
import 'package:qq_ui/src/router/calculations.dart';
import 'package:qq_ui/src/router/connection.dart';
import 'package:qq_ui/src/widget/emission_card.dart';

class AddView extends StatefulWidget {
  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  final List<EmissionCard> emissionsList = [
    EmissionCard(
      task: '100 Emissions',
      type: TYPE.WALK,
    ),
    EmissionCard(
      task: '100 Emissions',
      type: TYPE.WALK,
    ),
    EmissionCard(
      task: '100 Emissions',
      type: TYPE.TRAIN_LONG,
    ),
    EmissionCard(
      task: '100 Emissions',
      type: TYPE.TRAIN_LONG,
    )
  ];
  final int total = 0;
  int produced = 0;
  final TextEditingController controller = TextEditingController();
  ActivityType activityType = ActivityType.WALK;
  TextEditingController _distanceController = TextEditingController();
  TextEditingController _occupancyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    EmissionVault taskState = context.watch<EmissionVault>();
    return Container(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      TextField(
                        controller: _distanceController,
                        decoration: InputDecoration(
                          labelText: 'Enter the distance',
                          suffix: Text(' km'),
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      DropdownButtonFormField<ActivityType>(
                        items: ActivityType.values.map((item) {
                          return DropdownMenuItem<ActivityType>(
                            value: item,
                            child: Text(item.name),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'Select an option',
                        ),
                        onChanged: (value) {
                          setState(() {
                            activityType = value!;
                          });
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        controller: _occupancyController,
                        decoration: InputDecoration(
                          labelText: 'Enter the occupancy',
                        ),
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}')),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                checkforCalculation();
                              },
                              child: Icon(Icons.ad_units),
                            ),
                            SizedBox(width: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                // Handle submit button press
                              },
                              child: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.shade100),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text('Produced Emissions:', style: TextStyle(color: Colors.black)),
                                    Expanded(
                                        child: Text(
                                      ' ',
                                      textAlign: TextAlign.center,
                                    )),
                                    Text('Total Emissions:', style: TextStyle(color: Colors.black)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    produced != 0
                                        ? Text('$produced', style: TextStyle(color: Colors.black))
                                        : Text(''),
                                    Expanded(
                                        child: Text(
                                      ' ',
                                      textAlign: TextAlign.center,
                                    )),
                                    total != 0
                                        ? Text('Total Emissions:', style: TextStyle(color: Colors.black))
                                        : Text(''),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade100,
                            border: Border.all(
                              color: Colors.grey.shade400,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 4.0,
                                spreadRadius: 0.0,
                                offset: Offset(0, 30),
                              )
                            ]),
                        height: 200.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: emissionsList.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return emissionsList[index];
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkforCalculation() {
    if (_distanceController.text.isNotEmpty &&
        _occupancyController.text.isNotEmpty) {
      calculate(Calculation(activityType, _distanceController.text,
              _occupancyController.text))
          .then((value) {
       setState(() {
        produced = int.parse(value.body);
       });
      });
    } else {
      // Show an error message
    }
  }
}
