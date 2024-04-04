import 'package:flutter/material.dart';
import 'package:qq_ui/src/router/ActivityType.dart';

enum TYPE {
WALK, BIKE, BIKE_ELECTRIC, CAR_DIESEL, CAR_BENZIN, CAR_ELECTRIC, BUS, TRAIN_SHORT, TRAIN_LONG, AIRPLANE;
}

class EmissionCard extends StatelessWidget {
  const EmissionCard({
    super.key,
    required this.task,
    this.type = ActivityType.BUS,
  });

  final String task;
  final ActivityType type;

  Icon getIcon() {
    switch (type) {
      case ActivityType.WALK:
        return Icon(Icons.directions_walk);
      case ActivityType.BIKE:
        return Icon(Icons.directions_bike);
      case ActivityType.BIKE_ELECTRIC:
        return Icon(Icons.electric_bike);
      case ActivityType.CAR_DIESEL:
        return Icon(Icons.directions_car);
      case ActivityType.CAR_BENZIN:
        return Icon(Icons.local_gas_station);
      case ActivityType.CAR_ELECTRIC:
        return Icon(Icons.electric_car);
      case ActivityType.BUS:
        return Icon(Icons.directions_bus);
      case ActivityType.TRAIN_SHORT:
        return Icon(Icons.train);
      case ActivityType.TRAIN_LONG:
        return Icon(Icons.train);
      case ActivityType.AIRPLANE:
        return Icon(Icons.airplanemode_active);
      default:
        return Icon(Icons.directions_walk);
    }
  }

  Map<String, dynamic> toJson() {
    return {'task': task, 'type': type.toString()};
  }

  factory EmissionCard.fromJson(Map<String, dynamic> json) {
    return EmissionCard(task: json['task'],type: json['type']);
    }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final style = theme.textTheme.displayMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontStyle: FontStyle.italic,
        fontSize: 23.0);
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              Container(
                  child: getIcon(),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.all(Radius.circular(3)),
                  )),
              SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  task,
                  style: style,
                  textAlign: TextAlign.center,
                ),
              ),
            
            ],
          )),
    );
  }
}
