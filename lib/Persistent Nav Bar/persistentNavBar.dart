// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:vendor_app/screen/homePage.dart';
import 'package:vendor_app/screen/location_fetch.dart';
import 'package:vendor_app/screen/login2.dart';

class PersistentNavBar extends StatelessWidget {
  const PersistentNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.home),
          title: ("Home"),
          activeColorPrimary: Colors.red,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(CupertinoIcons.settings),
          title: ("Settings"),
          activeColorPrimary: Colors.red,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.white,
        ),
      ];
    }

    return PersistentTabView(
      context,
      backgroundColor: Colors.red,
      controller: _controller,
      screens: [
        homepage(),
        Location_fetch(),
      ],
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
