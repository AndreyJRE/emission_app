import 'package:flutter/material.dart';
import 'package:qq_ui/src/sample_feature/sample_item.dart';
import 'package:qq_ui/src/sample_feature/sample_item_details_view.dart';

import '../settings/settings_view.dart';

/// Displays a list of SampleItems.
class EmissionListView extends StatelessWidget {
  const EmissionListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return 
    Row(children: [SizedBox(width: 20),
    Column(
          children: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ), 
          Image.asset(
            '/images/LogoApp.png'
            ,width: 200, 
            height: null,), 
        
          Column(children: [
           Text('Welcome Back', style: TextStyle(fontSize: 24)), 
           Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
            border: Border.all(color: Colors.black), // Add a black border
            borderRadius: BorderRadius.circular(10), // Optional: Add rounded corners
            ),
            width: 400, 
            child: TextField(
            decoration: InputDecoration(
              hintText: 'Enter your username here...', // Placeholder text
            ),
          )
           )
           , SizedBox(height: 8), 
           OutlinedButton(
              onPressed: () {
                // Add your button press logic here
              },
              style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue), // Set background color
              foregroundColor: MaterialStateProperty.all(Colors.white), // Set text color
              minimumSize: MaterialStateProperty.all(Size(200, 50)), // Set width and height
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Set border radius
                ),
              ),
              side: MaterialStateProperty.all(
                  BorderSide(color: Colors.black), // Set border color
              ),
              textStyle: MaterialStateProperty.all(
                TextStyle(
                  fontSize: 18, // Set text size to 18
                  fontWeight: FontWeight.bold, // Make text bold
                ),
              ),
              ),
              child: Text('Log in '),
            )

          ],)
             ,
        ],
      )],);
      
  }
}
