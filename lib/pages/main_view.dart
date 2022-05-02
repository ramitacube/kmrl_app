import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main_controller.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageCotroller,
        physics: NeverScrollableScrollPhysics(),
        children: [],
      ),
      bottomNavigationBar: ValueBuilder<int>(
        initialValue: 0,
        builder: (value, updateFn) => Container(
          color: Colors.grey[200],
          child: BottomNavigationBar(
            //opacity: .2,
            currentIndex: value,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey.shade800,
            onTap: (tab) {
              // if (tab == 2) HomeController.to.showAppOpenAd();

              controller.pageCotroller.animateToPage(
                tab,
                duration: controller.animationDuration,
                curve: Curves.ease,
              );
              updateFn(tab);
            },
            elevation: 8,
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: ImageIcon(AssetImage("assets/images/icons/home.png")),
              ),
              BottomNavigationBarItem(
                label: "Search",
                icon: ImageIcon(AssetImage("assets/images/icons/search.png")),
              ),
              BottomNavigationBarItem(
                label: "Rental",
                icon: ImageIcon(AssetImage("assets/images/icons/calendar.png")),
              ),
              BottomNavigationBarItem(
                label: "Notification",
                icon: ImageIcon(
                  AssetImage("assets/images/icons/notifications.png"),
                ),
              ),
              BottomNavigationBarItem(
                label: "Profile",
                icon: ImageIcon(AssetImage("assets/images/icons/profiles.png")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
