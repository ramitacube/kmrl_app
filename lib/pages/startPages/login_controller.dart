import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/network/base_controller.dart';
import 'package:kmrl_connect_to_business/network/endpoints.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';

class LoginController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final items = ['Mr.', 'Mrs.', 'Miss'];
  String? value;
  var mobile = "";
  String otp = "";

  Future<void> loginWithMobile() async {
    showLoading();
    var body = {"mobile_no": "$mobile"};
    var res = await apiClient.post(EndPoints.loginWithMobile, body: body);
    hideLoading();
    if (res["message"].contains("OTPGENERATED")) {
      otp = res["message"].split(":")[1];
      Get.toNamed(Routes.OTP);
    }
  }

  String getMobileMasked() {
    return "+91 ${mobile.substring(0, 2)}******${mobile.substring(7, 9)}";
  }

  Future<void> verifyOTP() async {
    if (otp.length != 6) {
      showSnackBar("Invalid OTP");
      return;
    }
    showLoading();
    var body = {"mobile_no": "$mobile", "otp": otp, "client_id": "9b37cbf34b"};
    var res = await apiClient.post(EndPoints.verifyOTP, body: body);
    if (res != null) {
      await sharedPreferenceHelper.saveUser(res, {"mobile_no": mobile});
      hideLoading();
      Get.offAllNamed(Routes.HOME);
    }
  }
}
