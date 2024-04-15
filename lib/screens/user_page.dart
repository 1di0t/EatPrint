import 'package:eat_print/screens/home_page.dart';
import 'package:flutter/material.dart';

import '../widget/post_widget.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.home_rounded),
                  onPressed: () {
                    Navigator.pop(context); // do something
                  },
                ),
                const Text('EatPrint')
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
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
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
