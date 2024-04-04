import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qq_ui/listeners/emissionValut.dart';
import 'package:qq_ui/src/router/User.dart';

class FriendsView extends StatefulWidget {
  const FriendsView({Key? key}) : super(key: key);



  @override
  State<FriendsView> createState() => _FriendsViewState();
}

class _FriendsViewState extends State<FriendsView> {
  bool addEntry = false;
  @override
  Widget build(BuildContext context) {
      EmissionVault taskState = context.watch<EmissionVault>();
    // Sample data for Max Mustermann's friends

    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20), // Add space between appbar and content
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey), // Border color
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            taskState.user.name,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '',
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
              ),
              SizedBox(height: 20), // Add space between name and friends
              ButtonWidget(text: addEntry? 'go Back':'add Friends',color: addEntry?Colors.blue.shade400 :Colors.red,fun:  () => {
                print('fun'),
                setState(() {
                  addEntry = !addEntry;
                })
              },),
              SizedBox(height: 20), // Add space between name and friends
              Text(
                addEntry? 'Select a new Friend:':'Your Friends:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Divider(),
              SizedBox(height: 10), // Add space between text and friends' boxes
              // Display friends' list using ListView.builder
              Expanded(
                child: SingleChildScrollView(
                  
                  child: Column(
                    children: addEntry?taskState.getAllUsers().map((friend) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        padding: EdgeInsets.all(2.0), // Add padding for spacing
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Rounded corners
                        ),
                        child: AvatarWidgetAdd(friend: friend,controller: taskState,),
                      );
                    }).toList()
                   :taskState.friends.map((friend) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 5.0),
                        padding: EdgeInsets.all(2.0), // Add padding for spacing
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0), // Rounded corners
                        ),
                        child: AvatarWidget(friend: friend),
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

class ButtonWidget extends StatelessWidget {
  final Color color;
  final String text;
  final Function fun;
  const ButtonWidget({
    required this.fun,
    required this.text,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
  onPressed: fun as VoidCallback?,
  style: ElevatedButton.styleFrom(
    primary: color, // Background color
    onPrimary: Colors.black, // Text color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0), // Rounded corners
      side: BorderSide(color: Colors.black.withOpacity(0.2)), // Border color
    ),
    shadowColor: color.withOpacity(0.8), // Shadow color
    elevation: 0, // No elevation
  ),
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.comfortaa(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  ),
);

}
}

class AvatarWidget extends StatelessWidget {
  final User friend;

  const AvatarWidget({
    super.key,
    required this.friend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light grey background color
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: Offset(0, 3), // Offset [horizontal, vertical]
      )],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  friend.name,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )]),
                SizedBox(height: 5), // Add space between name and line
                Column(
                  children: [
                        
        
                    Text(
                      'Emissions: ${friend.totalEmissions} kg CO2',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
          ],
        ),
      ),
    );
  }
}

class AvatarWidgetAdd extends StatelessWidget {
  final User friend;
  final EmissionVault controller;

  const AvatarWidgetAdd({
    super.key,
    required this.controller,
    required this.friend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200], // Light grey background color
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius: 2, // Spread radius
            blurRadius: 5, // Blur radius
            offset: Offset(0, 3), // Offset [horizontal, vertical]
      )],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/flutter_logo.png', // Image path
              ),
              radius: 20, // Set radius of the circular image
            ),
            SizedBox(width: 10), // Add space between image and text
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Text(
                              friend.name,
              style: TextStyle(
                fontSize: 16,
              )
            
            ),              
                TextButton(
                onPressed: ()=>{
                  controller.addFriend(friend)
                },
                child: Icon(
                  
                  Icons.add,
                  color: Colors.black,
                ),
              )]),
          ],
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
