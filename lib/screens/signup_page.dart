import 'package:eat_print/widget/input_field_widget.dart';
import 'package:flutter/material.dart';

import '../api/auth_api.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _useridController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();

  String? _errorMessage;
  bool isRegistered = false;

  checkSuccess() {
    if (isRegistered == true) {
      Navigator.pop(context);
    }
  }

  Future<void> _signup() async {
    final statusCode = await signup(
        _useridController.text,
        _passwordController.text,
        _nameController.text,
        _nicknameController.text);

    if (statusCode == 201) {
      setState(() {
        isRegistered = true;
      });
      checkSuccess();
    } else if (statusCode == 409) {
      setState(() {
        _errorMessage = '이미 존재하는 아이디입니다.';
      });
    } else {
      setState(() {
        _errorMessage = '회원가입 실패';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16 * 3),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 50),
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 50),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InputField(
                            controller: _useridController, hintText: 'Id'),
                        const SizedBox(height: 10),
                        InputField(
                            controller: _passwordController,
                            hintText: 'Password',
                            obscureText: true),
                        const SizedBox(height: 10),
                        InputField(
                            controller: _nameController, hintText: 'Name'),
                        const SizedBox(height: 10),
                        InputField(
                            controller: _nicknameController,
                            hintText: 'NickName'),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          color: Theme.of(context).primaryColor,
                          child: TextButton(
                            onPressed: _signup,
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0)),
                            ),
                          ),
                        ),
                        if (_errorMessage != null)
                          Text(
                            _errorMessage!,
                            style: const TextStyle(color: Colors.red),
                          ),
                      ],
                    ),
                  ),
                ])));
  }
}
