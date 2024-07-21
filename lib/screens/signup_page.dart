import 'package:flutter/material.dart';

import '../api/auth_api.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _useridController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;
  bool isRegistered = false;

  checkSuccess() {
    if (isRegistered == true) {
      Navigator.pop(context);
    }
  }

  Future<void> _signup() async {
    final statusCode =
        await signup(_useridController.text, _passwordController.text);

    if (statusCode == 201) {
      setState(() {
        isRegistered = true;
      });
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
      appBar: AppBar(title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _useridController,
              decoration: const InputDecoration(labelText: 'User ID'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signup,
              child: const Text('Sign Up'),
            ),
            if (_errorMessage != null)
              Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
