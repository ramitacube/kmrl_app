import 'dart:async';

import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/network/base_controller.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';

class SplashController extends BaseController {
  @override
  Future onInit() async {
    super.onInit();
    navigate();
  }

  Future<void> navigate() async {
    checkLogin().then((value) => {
          if (value)
            {Get.offAndToNamed(Routes.HOME)}
          else
            {Get.offAllNamed(Routes.LAUNCH)}
        });
  }

  @override
  void onClose() {
    Get.delete();
    print("[ MainController ] => onClose()");
    super.onClose();
  }
}
