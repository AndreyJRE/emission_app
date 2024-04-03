import 'package:qq_ui/src/router/ActivityType.dart';

class EmissionActivity {

  final String co2;
  final String distance;
  final ActivityType activity; 

  EmissionActivity({required this.co2, required this.distance, required this.activity});
  
 factory EmissionActivity.fromJson(Map<String, dynamic> json) {
    switch (json) {
      case {
        'co2': String co2,
        'distance': String distance,
        'activity': ActivityType activity,
      }:
        return EmissionActivity(
          co2: co2,
          distance: distance,
          activity: activity,
        );
      default:
        throw const FormatException('Failed to load activity.');
    }
  }
}



