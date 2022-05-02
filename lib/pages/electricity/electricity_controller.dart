import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ElectricityController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final bool expanded = false;
  final bool paidExpanded = false;
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  formatDate(String? date) {
    if (date == null) {
      return "";
    }
    var formated = DateFormat("yyyy-mm-dd").parse(date);
    return DateFormat("dd-MMM-yy").format(formated);
  }

  formatMonth(String? date) {
    if (date == null) {
      return "";
    }
    var formatedMon = DateFormat('yyyy-mm-dd').parse(date);
    return DateFormat('MMM yyyy').format(formatedMon);
  }
}
