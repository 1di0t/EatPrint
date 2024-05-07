import 'package:eat_print/widget/app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../widget/post_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarWidget(operateOnPressed: true),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '전성일',
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(Icons.supervised_user_circle, size: 30)
                ],
              ),
            ),
            Container(
              height: 3,
              color: Colors.grey.withOpacity(0.1),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //A grid that can define a fixed number of tiles in the cross axis.
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return const Post();
                },
                itemCount: 20,
              ),
            ),
          ],
        ));
  }
}
