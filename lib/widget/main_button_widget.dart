import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final IconData iconData;
  final Widget nextPage;
  const MainButton({super.key, required this.iconData, required this.nextPage});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(iconData, size: 60),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => nextPage));
        });
  }
}
