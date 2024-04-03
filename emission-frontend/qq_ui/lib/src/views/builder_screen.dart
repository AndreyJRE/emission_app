import 'package:flutter/material.dart';

class BuilderScreen extends StatelessWidget {
  const BuilderScreen(
      {super.key, required this.switchState, required this.off});

  final Function(int) switchState;
  final Function() off;

  void validateData() {}

  Widget build(BuildContext context) {
    var controller = TextEditingController();
    int? value = 1;
    var dateController = TextEditingController();
    var validateData = (() {
      if (controller.text != '' && dateController.text != '' && value != null) {
        print('hey');
        off();
        switchState(0);
      }
    });
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Task:',style: TextStyle(fontSize: 20)),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                    icon:
                        Icon(Icons.account_balance_wallet), //icon of text field
                    labelText: "Enter Task" //label text of field
                    ),
              ),
            ),
            Text("Task type:"),
            DropdownButton(
                value: value,
                items: const [
                  DropdownMenuItem(child: Text('basic'), value: 1),
                  DropdownMenuItem(
                    child: Text('fitness'),
                    value: 2,
                  ),                  
                  DropdownMenuItem(
                    child: Text('studies'),
                    value: 3,
                  )
                ],
                onChanged: (val) {
                  value = val;
                }),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
              child: TextField(
                  controller:
                      dateController, //editing controller of this TextField
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Due until:" //label text of field
                      ),
                  readOnly: true, // when true user cannot edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate: DateTime
                            .now(), //DateTime.now() - not to allow to choose before today.
                        lastDate:
                            DateTime.now().add(const Duration(days: 370)));
                    if (pickedDate != null) {
                      dateController.text = pickedDate.toString();
                    }
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        off();
                        switchState(0);
                      },
                      child: const Text('back')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        validateData();
                      },
                      child: const Text('enter')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
