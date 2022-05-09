import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kmrl_connect_to_business/models/electricity_modal.dart';
import 'package:kmrl_connect_to_business/models/meter_modal.dart';
import 'package:kmrl_connect_to_business/models/meter_modal.dart';
import 'package:kmrl_connect_to_business/network/base_controller.dart';
import 'package:kmrl_connect_to_business/network/endpoints.dart';

class ElectricityController extends BaseController {
  List<ElectricityList> invoiceAll = [];
  final bool expanded = false;
  final bool paidExpanded = false;
  final storage = FlutterSecureStorage();
  var filterFromLease;
  @override
  Future<void> onInit() async {
    await super.onInit();
    filterFromLease = Get.arguments;
    getPendingInvoices();
  }

  Future<void> getPendingInvoices() async {
    var name = await storage.read(key: "name");
    print(name);
    await Future.delayed(Duration(milliseconds: 100));
    showLoading();

    var filters = filterFromLease == null
        ? '&filters=[["customer","=","$name"]]'
        : '&filters=[["material_no","=","$filterFromLease"]]';
    var res =
        await apiClient.get("${EndPoints.getElectricityMeterReading}&$filters");
    if (res != null) {
      var salesData = ElectricityModel.fromJson(res);
      invoiceAll = salesData.data;
      update();
    }
    hideLoading();
  }

  formatDate(String? date) {
    if (date == null) {
      return "";
    }
    var formated = DateFormat("yyyy-mm-dd").parse(date);
    return DateFormat("dd-mm-yyyy").format(formated);
  }

  formatMonth(String? date) {
    if (date == null) {
      return "";
    }
    var formatedMon = DateFormat('yyyy-mm-dd').parse(date);
    return DateFormat('MMM yyyy').format(formatedMon);
  }
}
