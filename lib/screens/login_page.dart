import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widget/input_field_widget.dart';
import 'home_page.dart';
import 'signup_page.dart';
import '../api/auth_api.dart';
import 'dart:developer' as developer;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _useridController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLogined = false;
  String? _errorMessage;

  Future<void> _loginAndSave() async {
    final result =
        await login(_useridController.text, _passwordController.text);
    developer.log('result: $result', name: 'login');
    final statusCode = result['statusCode'];
    final body = result['body'];

    if (statusCode == 200) {
      final responseBody = body;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setInt('user_num', responseBody['user_num']);
      setState(() {
        isLogined = true;
        _errorMessage = null;
      });
    } else if (statusCode == 404) {
      setState(() {
        _errorMessage = '존재하지 않는 아이디입니다.';
      });
    } else if (statusCode == 401) {
      setState(() {
        _errorMessage = '잘못된 비밀번호입니다.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Page Loading
    //If the user is already logged in, the page is redirected to the home page.
    if (isLogined == true) {
      Future.microtask(() {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16 * 3),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              const Text(
                'Login',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InputField(controller: _useridController, hintText: 'Id'),
                    const SizedBox(height: 10),
                    InputField(
                        controller: _passwordController,
                        hintText: 'Password',
                        obscureText: true),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      color: Theme.of(context).primaryColor,
                      child: TextButton(
                        onPressed: _loginAndSave,
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ),
                    if (_errorMessage != null)
                      Text(
                        _errorMessage!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Text('계정이 없으신가요?'),
                          const SizedBox(width: 5),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupPage()),
                              );
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
