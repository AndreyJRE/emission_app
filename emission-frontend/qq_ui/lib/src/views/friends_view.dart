import 'package:flutter/material.dart';

class FriendsView extends StatelessWidget {
  const FriendsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for Max Mustermann's friends
    List<String> friends = [
      'Friend 1',
      'Friend 2',
      'Friend 3',
      'Friend 4',
      'Fred',
      'Fren',
      'Friende',
      'uibsidfuh',
      'aoushdoiajsd',
      'aushdiuhqou',
      'Asdiuba'
    ];

    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20), // Add space between appbar and content
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Max',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Mustermann',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/flutter_logo.png', // Image path
                    ),
                    radius: 25, // Set radius of the circular image
                  ),
                ],
              ),
              SizedBox(height: 20), // Add space between name and friends
              Text(
                'Your Friends',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10), // Add space between text and friends' boxes
              // Display friends' list using ListView.builder
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: friends.map((friend) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        padding: EdgeInsets.all(10.0), // Add padding for spacing
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Rounded corners
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/images/flutter_logo.png', // Image path
                              ),
                              radius: 20, // Set radius of the circular image
                            ),
                            SizedBox(width: 10), // Add space between image and text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  friend,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 5), // Add space between name and line
                                Text(
                                  'Emissions: 0',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FriendsView(),
    debugShowCheckedModeBanner: false, // Hide debug banner
  ));
}
