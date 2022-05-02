import 'package:get/get.dart';

import 'leaseDetails_controller.dart';

class LeaseDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LeaseDetailsController>(LeaseDetailsController());
  }
}
