import 'package:flutter/material.dart';

class NavigatingButton extends StatelessWidget {
  final IconData iconData;
  final Widget nextPage;
  final double size;
  const NavigatingButton(
      {super.key,
      required this.iconData,
      required this.nextPage,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(iconData, size: size),
        onPressed: () {
          final route = MaterialPageRoute(builder: (context) => nextPage);
          Navigator.pushAndRemoveUntil(context, route, (route) => false);
        });
  }
}
