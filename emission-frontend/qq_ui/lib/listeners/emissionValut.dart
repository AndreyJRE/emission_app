import 'package:flutter/material.dart';
import 'package:qq_ui/src/router/User.dart';
import 'package:qq_ui/src/router/emissionActivity.dart';

class EmissionVault extends ChangeNotifier {
User user = User.Dummy('temp');
List<EmissionActivity> emissions = [];


void addEmission(EmissionActivity emission){
  emissions.add(emission);
  notifyListeners();
} 

void setEmissions(List<EmissionActivity> emissions){
  this.emissions = emissions;
  notifyListeners();
} 

getEmissions(){
  return emissions;
}

void setUser(String username, double emission){
  user = User(name: username, totalEmissions: emission);
  notifyListeners();
}
User getUser(){
  return user;
  }

}