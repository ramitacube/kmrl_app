import 'package:get/get.dart';

import 'lease_controller.dart';

class LeaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeaseController());
  }
}
