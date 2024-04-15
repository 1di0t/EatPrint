import 'dart:math';

import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  String randomImage() {
    int random = Random().nextInt(3);
    if (random == 0) {
      return 'assets/images/main_icon.png';
    }
    if (random == 1) {
      return 'assets/images/steak.png';
    }
    if (random == 2) {
      return 'assets/images/app_icon.png';
    }
    return 'assets/images/main_icon.png';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        child: Column(
          children: [
            Image.asset(
              randomImage(),
              fit: BoxFit.cover,
            ),
          ],
        ));
  }
}
