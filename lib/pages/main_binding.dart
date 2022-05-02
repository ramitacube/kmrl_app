import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/pages/main_controller.dart';

import 'leaseDetails/leaseDetails_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
    Get.put<LeaseDetailsController>(LeaseDetailsController());
  }
}
