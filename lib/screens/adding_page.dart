import 'package:eat_print/widget/app_bar_widget.dart';
import 'package:eat_print/widget/image_selecting_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddingPage extends StatelessWidget {
  const AddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: AppBarWidget(operateOnPressed: true),
        body: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: ImageSelectingButton(),
            ),
          ],
        ));
  }
}
