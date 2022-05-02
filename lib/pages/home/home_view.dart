import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kmrl_connect_to_business/pages/bottomNav/bottomnavBar.dart';
import 'package:kmrl_connect_to_business/pages/drawer/drawer_view.dart';
import 'package:kmrl_connect_to_business/pages/electricity/electricity_view.dart';
import 'package:kmrl_connect_to_business/pages/home/home_controller.dart';
import 'package:kmrl_connect_to_business/pages/homeDashboard/homeDashboard_view.dart';
import 'package:kmrl_connect_to_business/pages/invoice/invoice_view.dart';
import 'package:kmrl_connect_to_business/pages/meter/meter_view.dart';
import 'package:kmrl_connect_to_business/pages/water/water_view.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  get disableBack => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      drawer: DrawerWidget(
        onPageChange: (index) {
          controller.updateBottomNavIndex(index);
        },
      ),
      bottomNavigationBar: BottomNavBar(
        onPageChange: (index) {
          controller.updateBottomNavIndex(index);
        },
      ),
      body: GetBuilder<HomeController>(builder: (controller) {
        switch (controller.bottomNavIndex) {
          case 1:
            return InvoiceView(disableBack: true);
          case 2:
            return ElectricityView(disableBack: true);
          case 3:
            return WaterView(disableBack: true);
          case 4:
            return MeterView(disableBack: true);
          case 0:
          default:
            return HomeDashboardView();
        }
      }),
    );
  }
}
