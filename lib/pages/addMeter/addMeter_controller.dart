import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_gallery_camera/image_picker_gallery_camera.dart';

class AddMeterController extends GetxController {
  final GlobalKey<ScaffoldState> addMeterScaffoldKey =
      new GlobalKey<ScaffoldState>();
  final bool expanded = false;
  final bool paidExpanded = false;
  var thisImage;
  String type = 'Electricity';
  @override
  void onInit() async {
    super.onInit();
  }

  Future<String> getType(int num) async {
    if (num == 1) {
      print('Electricity');
      type = 'Electricity';
      update();
      return 'Electricity';
    }
    print('Water');
    type = 'Water';
    update();
    return 'Water';
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
