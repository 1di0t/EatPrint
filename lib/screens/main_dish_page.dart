import 'package:flutter/material.dart';

class MainDishPage extends StatelessWidget {
  const MainDishPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EatPrint'),
      ),
      body: const Center(
        child: Text('Main Dish Page'),
      ),
    );
  }
}
