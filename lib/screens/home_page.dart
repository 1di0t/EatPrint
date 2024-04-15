import 'package:eat_print/screens/adding_page.dart';
import 'package:eat_print/screens/desert_page.dart';
import 'package:eat_print/screens/user_page.dart';
import 'package:flutter/material.dart';

import '../widget/main_button_widget.dart';
import 'main_dish_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('EatPrint'),
              Icon(Icons.restaurant_menu_rounded, size: 30)
            ],
          ),
        ),
        body: Padding(
          //upper part of the body
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(children: [
            const SizedBox(height: 70),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MainButton(
                      iconData: Icons.restaurant_menu_rounded,
                      nextPage: MainDishPage()),
                  MainButton(
                      iconData: Icons.cake_rounded, nextPage: DesertPage()),
                ],
              ),
            ),
            Row(
              //image
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/main_icon.png',
                  width: 300,
                  height: 300,
                )
              ],
            ),
            const Padding(
              //lower part of the body
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MainButton(
                      iconData: Icons.account_circle_rounded,
                      nextPage: UserPage()),
                  MainButton(
                      iconData: Icons.add_circle_outline_outlined,
                      nextPage: AddingPage()),
                ],
              ),
            ),
          ]),
        ));
  }
}
