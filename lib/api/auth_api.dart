import 'package:http/http.dart' as http;
import 'dart:convert';

const baseURL = 'http://127.0.0.1:5000';
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
