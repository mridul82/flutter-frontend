import 'dart:convert';

// import 'package:fluuter_front_end/model/User.dart';
import 'package:http/http.dart' as http;

Future<String> signUp({String email, String name, String password}) async {
  print(email);
  var response = await http.post(
    'http://192.168.0.105:5000/api/users/register',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'email': email,
      'password': password,
    }),
  );
  return response.body;
}
