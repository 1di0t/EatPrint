import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Eat Print'),
              Icon(Icons.account_circle_rounded, size: 30)
            ],
          ),
        ),
        body: Column(children: [
          const SizedBox(height: 100),
          const Row(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/steak.png',
                width: 300,
                height: 300,
              )
            ],
          )
        ]));
  }
}
