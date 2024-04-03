import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:qq_ui/src/router/ActivityType.dart';
import 'package:qq_ui/src/router/calculations.dart';

final host = '134.155.225.194:8080';
final headers = {HttpHeaders.contentTypeHeader: 'application/json'};

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
print(jsonString);
final uri = Uri.http(host, '/v1/api/emissions/calculate');
final headers = {'Content-Type': 'application/json'};
final response = await http.post(uri, headers: headers, body: jsonString);
return response;
}
Future<http.Response> getActivities(){
  return http.get(Uri.parse('$host/v1/api/activities'));
}
Future<http.Response> addActivity(Calculation calculation) async {
  Response response = await http.post(Uri.parse('$host/v1/api/activities/add'), body: json.encode(calculation), headers: headers);
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

class Activity {

  final String co2;
  final String distance;
  final ActivityType activity; 

  Activity({required this.co2, required this.distance, required this.activity});
  
 factory Activity.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case {
        'co2': String co2,
        'distance': String distance,
        'activity': ActivityType activity,
      }:
        return Activity(
          co2: co2,
          distance: distance,
          activity: activity,
        );
      default:
        throw const FormatException('Failed to load activity.');
    }
  }
}



