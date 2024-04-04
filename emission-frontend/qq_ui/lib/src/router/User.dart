import 'dart:math';

class User{
  String name;
  double totalEmissions;

  User({required this.name, required this.totalEmissions});

  factory User.Dummy(String name){
    return User(name: name, totalEmissions: Random().nextInt(2000).toDouble());
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['username'], totalEmissions: json['totalEmission']);
  }


}