import 'package:qq_ui/src/router/ActivityType.dart';

class EmissionActivity {

  final String co2;
  final String distance;
  final ActivityType activity; 
  final String username;

  EmissionActivity({required this.co2, required this.distance, required this.activity, required this.username});

  Map<String, dynamic> toJson() => {
    'activityType': activity.toString().split('.').last,
    'distance': distance,
    'co2': co2,
    'username': username
  };
  
 factory EmissionActivity.fromJson(Map<String, dynamic> json) {
    return EmissionActivity(
      co2: json['co2'].toString(),
      distance: json['distance'].toString(),
      activity: ActivityType.values.firstWhere((e) => e.toString().split('.').last == json['activityType']),
      username: 'not important'
    );
  }
}



