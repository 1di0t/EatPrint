import 'package:eat_print/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';

class AddingPage extends StatelessWidget {
  const AddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome to the Adding Page!'),
      ),
      bottomNavigationBar: AppBarWidget(),
    );
  }
}
