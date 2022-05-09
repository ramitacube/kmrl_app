import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/pages/meter/meter_controller.dart';

class MeterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MeterController());
  }
}
