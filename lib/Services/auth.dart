import 'dart:convert';

// import 'package:fluuter_front_end/model/User.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<int> signUp({String email, String name, String password}) async {
  print(email);
  var response = await http.post(
    'http://10.0.2.2:5000/api/users/register',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'password': password,
    }),
  );

  return (response) != null ? response.statusCode : 'error';
}

Future<int> signIn({String email, String password}) async {
  var response = await http.post(
    'http://192.168.0.105:5000/api/users/login',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    if (jsonResponse != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', jsonResponse['token']);
    }
  }
  return response.statusCode;
}
