import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:qq_ui/src/router/ActivityType.dart';
import 'package:qq_ui/src/router/calculations.dart';

final host = '134.155.225.194:8080';
final headers = {'Content-Type': 'application/json'};
Future<http.Response> testConnection() {
  return http.get(Uri.parse('$host/v1/api/test'));
}

printConnection(){
  testConnection().then((value) => print(value.body));
}

Future<http.Response> putUser(String username){
  return http.put(Uri.parse('$host/v1/api/users/add?username=$username'));
}

Future<http.Response> getAllUsers(){
  return http.get(Uri.parse('$host/v1/api/users'));
}

Future<http.Response> calculate(Calculation calculation) async {
final jsonString = json.encode(calculation);
final uri = Uri.http(host, '/v1/api/emissions/calculate');

final response = await http.post(uri, headers: headers, body: jsonString);
return response;
}


Future<http.Response> getActivities(){
  return http.get(Uri.parse('$host/v1/api/activities'));
}
Future<http.Response> addActivity(Calculation calculation) async {
  Response response = await http.post(Uri.http('$host/v1/api/activities/add'), body: json.encode(calculation), headers: headers);
  return http.get(
    Uri.parse('$host/v1/api/emissions'),
    headers: <String, String>{
      'co2': response.body,
      'distance': calculation.distance,
      'activity': calculation.activityType.toString().split('.').last,
    },
  );
}

Future<http.Response> getMyFriends(){
  return http.get(Uri.parse('$host/v1/api/emissions'));
}
