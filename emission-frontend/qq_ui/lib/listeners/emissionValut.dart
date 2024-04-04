import 'package:flutter/material.dart';
import 'package:qq_ui/src/router/User.dart';
import 'package:qq_ui/src/router/connection.dart';
import 'package:qq_ui/src/router/emissionActivity.dart';

class EmissionVault extends ChangeNotifier {
User user = User.Dummy('temp');
List<EmissionActivity> actvitites = [];
List<User> friends = [];
List<User> allUsers = [];
bool loading = false;
bool loggedIn = false;

void addEmissionValue(double val){
  user.totalEmissions += val;
  notifyListeners();
}
void setAllUsers(List<User> users){
  this.allUsers = users;
  notifyListeners();
}
List<User> getAllUsers(){
  return allUsers;
}

setFriends(List<User> friends){
  this.friends = friends;
  notifyListeners();
}

addFriend(User friend){
  addFriendfromUsername(user.name, friend.name);
  friends.add(friend);
  notifyListeners();
}
getMyFriends(){
  return friends;
}
void startLoading(){
  loading = true;
  loggedIn = true;
  notifyListeners();
  Future.delayed(Duration(seconds: 2), (){
    loading = false;
    print('loading $loading loggegIn $loggedIn');
    notifyListeners();
  });
      print('loading $loading loggegIn $loggedIn');
}

void addActivity(EmissionActivity emission){
  actvitites.add(emission);
  print(actvitites.length);
  notifyListeners();
} 

void setActivities(List<EmissionActivity> emissions){
  this.actvitites = emissions;
  notifyListeners();
} 

getActvities(){
  return actvitites;
}

void setUser(User userNew){
  user = userNew;
  notifyListeners();
}
User getUser(){
  return user;
  }


}