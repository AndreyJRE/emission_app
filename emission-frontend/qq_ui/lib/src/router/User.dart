class User{
  String name;
  double totalEmissions;

  User({required this.name, required this.totalEmissions});

  factory User.Dummy(String name){
    return User(name: name, totalEmissions: 0.0);
  }


}