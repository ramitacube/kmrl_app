import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  @override
  void onInit() {
    // navigationItems = NavigationService().getNavigationItemList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    // pageCotroller.dispose();
    Get.delete();
    print("[ MainController ] => onClose()");
    super.onClose();
  }
}
