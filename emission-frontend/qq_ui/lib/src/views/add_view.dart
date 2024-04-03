import 'package:flutter/material.dart';
import 'package:qq_ui/src/widget/emission_card.dart';

class AddView extends StatefulWidget {
  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  final List<EmissionCard> emissionsList = [EmissionCard(task: '100 Emissions',type: TYPE.WALK,),EmissionCard(task: '100 Emissions',type: TYPE.WALK,),EmissionCard(task: '100 Emissions',type: TYPE.TRAIN_LONG,),EmissionCard(task: '100 Emissions',type: TYPE.TRAIN_LONG,)];
  final int total = 0;
  final int produced = 0;
  @override
  Widget build(BuildContext context) {
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
                        decoration: InputDecoration(
                          labelText: 'Enter a number',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      DropdownButtonFormField<String>(
                        items: dropdownItems.map((String item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'Select an option',
                        ),
                        onChanged: (String? value) {
                          // Handle dropdown value change
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter personnel number',
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Handle submit button press
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
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.shade100),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(children: [Text('Produced Emissions:'),Expanded(child: Text(' ',textAlign: TextAlign.center,)),Text('Total Emissions:'),],),
                                                                                Row(children: [produced != 0 ?Text('Produced Emissions:'): Text(''),Expanded(child: Text(' ',textAlign: TextAlign.center,)),total != 0? Text('Total Emissions:'):Text(''),],),
                                      ],
                                    ),
                                  ),),
                      ),
                              Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.grey.shade100,border: Border.all(color: Colors.grey.shade400,),boxShadow: [BoxShadow(color: Colors.grey.shade400,blurRadius: 4.0,spreadRadius: 0.0,offset:  Offset(0, 30),)]),
            height: 200.0,
            child: ListView.builder(
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
}