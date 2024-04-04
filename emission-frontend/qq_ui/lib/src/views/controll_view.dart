import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qq_ui/listeners/emissionValut.dart';
import 'package:qq_ui/src/views/app.dart';
import 'package:qq_ui/src/views/login_view.dart';

class ControllView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        EmissionVault taskState = context.watch<EmissionVault>();
    return taskState.loggedIn? MainScreen(title: 'App') :LoginView();
  }
}