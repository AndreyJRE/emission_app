import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:qq_ui/src/router/ActivityType.dart';
import 'package:qq_ui/src/router/calculations.dart';
import 'package:qq_ui/src/router/emissionActivity.dart';

final host = 'emission.ambitiousrock-20a875ba.westeurope.azurecontainerapps.io';
final headers = {'Content-Type': 'application/json'};
Future<http.Response> testConnection() {
  return http.get(Uri.parse('$host/v1/api/test'));
}

printConnection(){
  testConnection().then((value) => print(value.body));
}

Future<http.Response> putUser(String username){
  return http.post(Uri.http(host,'/v1/api/users/add',{ 'username': username }));
}

Future<http.Response> getAllUsers(){
  return http.get(Uri.http(host,'/v1/api/users'));
}

Future<http.Response> calculate(Calculation calculation) async {
final jsonString = json.encode(calculation);
final uri = Uri.http(host, '/v1/api/emissions/calculate');

final response = await http.post(uri, headers: headers, body: jsonString);
return response;
}

Future<http.Response> getUserData(String username){
  return http.get(Uri.http(host,'/v1/api/users/$username'));
}

Future<http.Response> getFriends(String username){
  return http.get(Uri.http(host,'/v1/api/users/$username/friends'));
}

Future<http.Response> addFriend(String username, String friend){
  return http.post(Uri.http(host,'/v1/api/users/addFriend', {'username':username,'friendUsername': friend}));
}

Future<http.Response> getActivities(String username){
  return http.get(Uri.http(host,'/v1/api/activities', {'username': username}));
}
Future<http.Response> addActivity(EmissionActivity activity) async {
  return http.post(
    Uri.http(host,'/v1/api/activities/add'), body: json.encode(activity), headers: headers
  );
}
