import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool operateOnPressed;

  const AppBarWidget({super.key, required this.operateOnPressed});

  void isTrueOnPress(context) {
    // if operateOnPressed is true, then pop the current screen
    if (operateOnPressed) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: const Text(
                'EatPrint',
                style: TextStyle(
                    fontFamily: 'lobster',
                    fontSize: 30,
                    color: Color(0xff432818)),
              ),
              onPressed: () {
                isTrueOnPress(context);
              },
            ),
          ],
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
