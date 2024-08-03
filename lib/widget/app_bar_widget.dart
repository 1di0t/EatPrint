import 'package:eat_print/screens/adding_page.dart';
import 'package:eat_print/screens/home_page.dart';
import 'package:eat_print/screens/search_page.dart';
import 'package:eat_print/screens/setting_page.dart';
import 'package:eat_print/screens/user_page.dart';
import 'package:eat_print/widget/routing_button.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RoutingButton(
            iconData: Icons.home,
            nextPage: HomePage(),
            size: 36,
          ),
          RoutingButton(
            iconData: Icons.search_rounded,
            nextPage: SearchPage(),
            size: 36,
          ),
          RoutingButton(
            iconData: Icons.add_box_rounded,
            nextPage: AddingPage(),
            size: 36,
          ),
          RoutingButton(
            iconData: Icons.account_box_rounded,
            nextPage: UserPage(),
            size: 36,
          ),
          RoutingButton(
            iconData: Icons.settings,
            nextPage: SettingPage(),
            size: 36,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
