import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tonnsour/pages/plan_page.dart';
import 'package:tonnsour/pages/planner_page.dart';
import 'package:tonnsour/pages/settings_page.dart';
import 'package:tonnsour/utils/constants.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  static const TextStyle _menuStyle = TextStyle(
      color: kWhite,
      fontFamily: kPoppins,
      fontSize: 15.0,
      fontWeight: FontWeight.w800);

  static const List<Widget> _menus = <Widget>[PlanPage(), SettingsPage()];

  static const List<GButton> _menusButtons = <GButton>[
    GButton(
      icon: Icons.calendar_today_outlined,
      text: 'Plan',
      textStyle: _menuStyle,
    ),
    GButton(
      icon: Icons.settings_rounded,
      text: 'Settings',
      textStyle: _menuStyle,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _menus[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: kWhite, boxShadow: [
          BoxShadow(blurRadius: 20.0, color: kBlue.withOpacity(0.1))
        ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: GNav(
            gap: 8.0,
            activeColor: kWhite,
            color: kBlue,
            iconSize: 24.0,
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            tabBackgroundColor: kBlue,
            tabs: _menusButtons,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
