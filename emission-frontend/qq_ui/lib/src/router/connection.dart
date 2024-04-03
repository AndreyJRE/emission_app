import 'package:http/http.dart' as http;


Future<http.Response> testConnection() {
  return http.get(Uri.parse('http://134.155.225.194:8080/v1/api/test'));
}

printConnection(){
  testConnection().then((value) => print(value.body));
}