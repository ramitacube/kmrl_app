import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/pages/electricity/electricity_controller.dart';
import 'package:kmrl_connect_to_business/pages/homeDashboard/homeDashboard_controller.dart';
import 'package:kmrl_connect_to_business/pages/invoice/invoice_controller.dart';
import 'package:kmrl_connect_to_business/pages/meter/meter_controller.dart';
import 'package:kmrl_connect_to_business/pages/water/water_controller.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => InvoiceController());
    Get.lazyPut(() => ElectricityController());
    Get.lazyPut(() => WaterController());
    Get.lazyPut(() => MeterController());
    Get.lazyPut(() => HomeDashboardController());
  }
}
