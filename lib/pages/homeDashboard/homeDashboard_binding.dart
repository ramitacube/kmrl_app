import 'package:get/get.dart';

import 'homeDashboard_controller.dart';

class HomeDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeDashboardController>(HomeDashboardController());
  }
}
