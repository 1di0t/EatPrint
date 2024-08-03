import 'package:eat_print/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 50),
          Text(
            'Home',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 50),
        ],
      ),
      bottomNavigationBar: AppBarWidget(),
    );
  }
}
