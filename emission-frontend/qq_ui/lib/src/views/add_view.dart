import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:provider/provider.dart';
import 'package:qq_ui/listeners/emissionValut.dart';
import 'package:qq_ui/src/router/ActivityType.dart';
import 'package:qq_ui/src/router/calculations.dart';
import 'package:qq_ui/src/router/connection.dart';
import 'package:qq_ui/src/router/emissionActivity.dart';
import 'package:qq_ui/src/widget/emission_card.dart';

class AddView extends StatefulWidget {
  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  final int total = 0;
  int? produced;
  final TextEditingController controller = TextEditingController();
  ActivityType activityType = ActivityType.WALK;
  TextEditingController _distanceController = TextEditingController();
  TextEditingController _occupancyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    EmissionVault taskState = context.watch<EmissionVault>();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Container(
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
                                  checkForNewActivity(taskState);
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text('Produced Emissions:',
                                          style:
                                              TextStyle(color: Colors.black)),

                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      produced != null
                                          ? Text(
                                              '$produced',
                                              style: TextStyle(
                                                  color: Colors.black),
                                              textAlign: TextAlign.center,
                                            )
                                          : Text(''),
                                    
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Text('Total Emissions:',
                                          style:
                                              TextStyle(color: Colors.black,fontSize: 10)),
                                  FAProgressBar(
                                    direction: Axis.horizontal,
                                    backgroundColor: Colors.blueGrey,
                                    verticalDirection: VerticalDirection.up,
                                    currentValue:
                                        taskState.user.totalEmissions,
                                    displayText: ' kg CO2',
                                    maxValue: 2000,
                                    progressGradient: LinearGradient(
                                      colors: [
                                        Colors.green.withOpacity(0.75),
                                        Colors.red.withOpacity(0.75),
                                      ],
                                    ),
                                  )
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
                            itemCount: taskState.actvitites.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return EmissionCard(
                                  task: taskState.actvitites[index].co2,
                                  type: taskState.actvitites[index].activity);
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

  void checkForNewActivity(EmissionVault vault) {
    if (_distanceController.text.isNotEmpty &&
        _occupancyController.text.isNotEmpty &&
        produced != null) {
      addActivity(EmissionActivity(
              co2: produced.toString(),
              distance: _distanceController.text,
              activity: activityType,
              username: vault.user.name))
          .then((value) {
        print(value.body);
        EmissionActivity emissionActivity = EmissionActivity.fromJson(jsonDecode(value.body));
        vault.addActivity(emissionActivity);
        vault.addEmissionValue(double.parse(emissionActivity.co2));

      });
      setState(() {
        produced = null;
        _distanceController.clear();
        _occupancyController.clear();
      });
    }
  }
}
