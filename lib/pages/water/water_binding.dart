import 'package:get/get.dart';

import 'water_controller.dart';

class WaterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WaterController>(WaterController());
  }
}
