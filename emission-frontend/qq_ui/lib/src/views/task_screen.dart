import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qq_ui/listeners/emissionValut.dart';
import 'package:qq_ui/src/router/User.dart';
import 'package:qq_ui/src/router/connection.dart';
import 'package:qq_ui/src/router/emissionActivity.dart';
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
  EmissionVault taskState = context.watch<EmissionVault>();
  TextEditingController controller = TextEditingController();
  return MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
            Image.asset(
              '/images/LogoApp.png',
              width: 200,
              height: null,
            ),
            Text('Welcome Back'),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Enter your username here...',
                ),
              ),
            ),
            SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                login(controller, taskState);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(Size(200, 50)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                side: MaterialStateProperty.all(
                  BorderSide(color: Colors.black),
                ),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              child: Text('Log in'),
            ),
          ],
        ),
      ),
    ),
  );
}




  void login(TextEditingController controller,EmissionVault vault ){
    print(controller.text);
    try{
    putUser(controller.text).then((value) => print(value.body));}
    catch(e){
      print('already exists');
    }
    try{
    
    getUserData(controller.text).then((value) => vault.setUser(User.fromJson(jsonDecode(value.body)as Map<String, dynamic>) ));
    print('getting activities');
    getActivities(controller.text).then((value) => (json.decode(value.body) as List<dynamic>).map((e) => EmissionActivity.fromJson(e)).toList()).then((value) => vault.setActivities(value));}
    catch(e){
      print(e);
      vault.setUser(User.Dummy(controller.text));
    }
    vault.startLoading();
    

    
  }
}

class LoadingView extends StatelessWidget {
  final String text;
  const LoadingView({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(),
                const SizedBox(height: 50),
                Text(
                  text,
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                )
              ],
            )));
  }
}
