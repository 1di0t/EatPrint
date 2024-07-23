import 'package:eat_print/api/auth_api.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EatPrint'),
      ),
      body: TextButton(
        onPressed: () {
          logout();
        },
        child: const Text('logout'),
      ),
    );
  }
}
