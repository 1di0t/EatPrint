import 'package:flutter/material.dart';

class AddingPage extends StatelessWidget {
  const AddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EatPrint'),
      ),
      body: const Center(
        child: Text('Adding Page'),
      ),
    );
  }
}
