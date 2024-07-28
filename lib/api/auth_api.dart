import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

import '../main.dart';
import '../screens/login_page.dart'; //to use navigatorKey and isLoggedIn

const baseURL = 'http://127.0.0.1:5000';

Future<void> logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('user_id');
  navigatorKey.currentState!.pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const LoginPage()),
    (Route<dynamic> route) => false,
  );
}

Future<bool> checkLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? userId = prefs.getInt('user_id');
  developer.log('userId: $userId', name: 'checkLoginStatus');
  return userId != null;
}

//send a POST request to the server to register a new user
Future<int> signup(String userid, String userpw) async {
  final response = await http.post(
    Uri.parse('$baseURL/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'userid': userid,
      'userpw': userpw,
    }),
  );
  return response.statusCode;
}

//send a POST request to the server to log in a user
Future<Map<String, dynamic>> login(String userid, String userpw) async {
  //get resopnse from the DB server
  final response = await http.post(
    Uri.parse('$baseURL/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
    body: jsonEncode(<String, String>{
      'userid': userid,
      'userpw': userpw,
    }),
  );

  return {
    'statusCode': response.statusCode,
    'body': json.decode(response.body),
  };
}
