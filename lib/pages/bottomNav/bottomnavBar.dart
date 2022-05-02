import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key, @required this.onPageChange}) : super(key: key);
  final onPageChange;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onPageChange(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      backgroundColor: kPrimaryColor,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/home_logo.png'),
          label: 'Home',
          backgroundColor: kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/paper.png'),
          label: 'Invoice',
          backgroundColor: kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/bulb.png'),
          label: 'Electricity',
          backgroundColor: kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/water.png'),
          label: 'Water',
          backgroundColor: kPrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/images/pressure.png'),
          label: 'Meter',
          backgroundColor: kPrimaryColor,
        ),
      ],
    );
  }
}
