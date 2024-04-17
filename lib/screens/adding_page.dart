import 'package:eat_print/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';

class AddingPage extends StatelessWidget {
  const AddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(operateOnPressed: true),
      body: Center(
        child: Text('Adding Page'),
      ),
    );
  }
}
