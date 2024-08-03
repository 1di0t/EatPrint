import 'package:flutter/material.dart';

class RoutingButton extends StatelessWidget {
  final IconData iconData;
  final Widget nextPage;
  final double size;
  const RoutingButton(
      {super.key,
      required this.iconData,
      required this.nextPage,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(iconData, size: size),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => nextPage,
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
              (route) => false);
        });
  }
}
