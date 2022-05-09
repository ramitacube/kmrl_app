import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/pages/electricity/electricity_controller.dart';
import 'package:kmrl_connect_to_business/pages/meter/meter_controller.dart';

class ElectricityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ElectricityController());
  }
}
