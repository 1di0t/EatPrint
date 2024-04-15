import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widget/post_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Text(
                    'EatPrint',
                    style: TextStyle(
                        fontFamily: 'lobster',
                        fontSize: 30,
                        color: Color(0xff432818)),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // do something
                  },
                ),
              ],
            )),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '마승현',
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
