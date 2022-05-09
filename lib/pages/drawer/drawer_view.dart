import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/network/shared_preference_helper.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/smartWidgets/drawerTile.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({Key? key, @required this.onPageChange}) : super(key: key);
  final onPageChange;
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onPageChange(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.0, color: Color(0xffDBDBDB))),
            ),
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                            text: 'Connect to ',
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(fontSize: 24),
                            children: [
                              TextSpan(
                                text: 'Business',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline2!
                                    .copyWith(fontSize: 24),
                              ),
                            ]),
                      ),
                      Container(
                          // margin: EdgeInsets.only(left: 15),
                          child: Text(
                        'One App for Enterprise Property Management',
                        style: Theme.of(context)
                            .textTheme
                            .headline3!
                            .copyWith(fontSize: 10),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DrawerTile(
              title: 'Dashboard',
              leading: KmrlIcons.logoSmall(),
              onTapped: () {
                Get.back();
                Get.toNamed(Routes.HOME);
              }),
          DrawerTile(
              title: 'Notification',
              leading: Icon(Icons.notifications),
              onTapped: () {
                Get.back();
                Get.toNamed(Routes.HOME);
              }),
          DrawerTile(
              title: 'Lease Accounts',
              leading: KmrlIcons.lease(),
              onTapped: () {
                if (Get.currentRoute != Routes.LEASE) {
                  Get.back();
                  Get.toNamed(Routes.LEASE);
                } else {
                  Get.back();
                }
              }),
          DrawerTile(
              title: 'Invoices',
              leading: KmrlIcons.invoice(),
              onTapped: () {
                Get.back();
                Get.toNamed(Routes.INVOICE);
              }),
          DrawerTile(
              title: 'Payments',
              leading: KmrlIcons.payment(),
              onTapped: () {
                Get.back();
                Get.toNamed(Routes.PAYMENT);
              }),
          DrawerTile(
              title: 'Electricity',
              leading: KmrlIcons.bulb(),
              onTapped: () {
                Get.back();
                Get.toNamed(Routes.ELECTRICITY);
              }),
          DrawerTile(
              title: 'Water',
              leading: KmrlIcons.water(),
              onTapped: () {
                Get.back();
                Get.toNamed(Routes.WATER);
              }),
          DrawerTile(
              title: 'Support',
              leading: KmrlIcons.helpDesk(),
              onTapped: () {
                Get.toNamed(Routes.HELPDESK);
              }),
          DrawerTile(
              title: 'Logout',
              leading: Image.asset('assets/images/profileLogout.png'),
              onTapped: () {
                Get.offAllNamed(Routes.LOGIN);
                SharedPreferenceHelper()..removeAll();
              }),
        ],
      ),
    );
  }
}
