class User{
  String name;
  double totalEmissions;

  User({required this.name, required this.totalEmissions});

  factory User.Dummy(String name){
    return User(name: name, totalEmissions: 0.0);
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json['username'], totalEmissions: json['totalEmission']);
  }


}