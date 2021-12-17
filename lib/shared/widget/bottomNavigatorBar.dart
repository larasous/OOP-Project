import 'package:flutter/material.dart';
import 'package:petservice_oop_app/core/core.dart';

// ignore: must_be_immutable
class BottomNavigationBarHome extends StatefulWidget {
  int selectedIndex;
  BottomNavigationBarHome({Key key, this.selectedIndex}) : super(key: key);

  @override
  _BottomNavigationBarHomeState createState() =>
      _BottomNavigationBarHomeState();
}

class _BottomNavigationBarHomeState extends State<BottomNavigationBarHome> {
  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: AppColors.backgroundColor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today_rounded),
          label: 'Calendar',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedItemColor: AppColors.purple,
      onTap: _onItemTapped,
    );
  }
}
