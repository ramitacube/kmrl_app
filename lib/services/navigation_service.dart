import 'package:flutter/material.dart';

class NavigationService {
  List<BottomNavigationBarItem> getNavigationItemList() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
    ];
  }
}
