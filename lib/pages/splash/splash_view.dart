import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/pages/splash/splash_controller.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/splash.dart';

class SplashView extends GetView<SplashController> {
  final SplashController addTransactionController = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 12,
          ),
          Container(
            child: KmrlIcons.logo(),
          ),
          Expanded(child: Container()),
          Splash(),
          Expanded(child: Container()),
          Container(
              child: Image.asset(
            'assets/images/train.png',
            fit: BoxFit.cover,
          )),
        ],
      ),
    );
  }
}
