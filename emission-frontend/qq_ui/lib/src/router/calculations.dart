import 'package:qq_ui/src/router/ActivityType.dart';

class Calculation{
  ActivityType activityType;
  String distance;
  String occupancy;

  Calculation(this.activityType, this.distance, this.occupancy);

  Map<String, dynamic> toJson() => {
    'activityType': activityType.toString().split('.').last,
    'distance': distance,
    'occupancy': occupancy
  };

}