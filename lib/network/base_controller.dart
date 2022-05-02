import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:kmrl_connect_to_business/network/api_client.dart';
import 'package:kmrl_connect_to_business/network/network_exceptions.dart';
import 'package:kmrl_connect_to_business/network/shared_preference_helper.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';

class BaseController extends GetxController implements ErrorHandler {
  String _accessToken = "";
  String _mobile = "";
  late ApiClient apiClient;
  late SharedPreferenceHelper sharedPreferenceHelper;
  var multiLoading = 0;
  @override
  Future onInit() async {
    super.onInit();
    apiClient = ApiClient(errorHandler: this);
    sharedPreferenceHelper = SharedPreferenceHelper();
    await checkLogin();
  }

  String get accessToken => _accessToken;
  String get mobile => _mobile;

  @override
  void onClose() {
    Get.delete();
    print("[ MainController ] => onClose()");
    super.onClose();
  }

  @override
  onError({String? message, int? code, String? error}) {
    if (code == 403) {
      showSnackBar("Session Expired");
      logOut();
      return;
    }
    showSnackBar("$message");
  }

  void logOut() {
    sharedPreferenceHelper.clear();
    Get.offNamedUntil(Routes.LOGIN, (route) => false);
  }

  Future<bool> checkLogin() async {
    var isLoggedIn = await sharedPreferenceHelper.checkLogin();
    _accessToken = sharedPreferenceHelper.accessToken;
    _mobile = sharedPreferenceHelper.mobile;

    return isLoggedIn;
  }

  showSnackBar(String text, {var title, bool isSuccess = false}) {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    Get.showSnackbar(GetSnackBar(
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      title: title ?? "Error",
      message: text,
      duration: Duration(seconds: 1),
    ));
  }

  showLoading() {
    if (multiLoading == 0) {
      Get.defaultDialog(
        barrierDismissible: false,
        title: "",
        content: Center(
            child: Container(
                height: 100,
                width: 100,
                child: Image.asset('assets/images/milu.gif'))
            //     CircularProgressIndicator(
            //   color: kPrimaryColor,
            // )
            ),
        backgroundColor: Colors.white,
        titleStyle: TextStyle(color: kPrimaryColor),
      );
      multiLoading++;
    }
  }

  hideLoading() {
    if (multiLoading == 1) {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      multiLoading--;
    }
  }
}
