import 'package:get/get.dart';

import 'addMeter_controller.dart';

class AddMeterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AddMeterController>(AddMeterController());
  }
}
