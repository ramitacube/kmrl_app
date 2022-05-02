import 'package:get/get.dart';

import 'meter_controller.dart';

class MeterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MeterController>(MeterController());
  }
}
