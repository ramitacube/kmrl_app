import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kmrl_connect_to_business/models/meter_modal.dart';
import 'package:kmrl_connect_to_business/models/meter_modal.dart';
import 'package:kmrl_connect_to_business/network/base_controller.dart';
import 'package:kmrl_connect_to_business/network/endpoints.dart';

class MeterController extends BaseController {
  List<MeterList> invoiceAll = [];
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

    var filters = 'filters=[["customer","=","$name"]]';
    var res =
        await apiClient.get("${EndPoints.getCurrentMeterReading}&$filters");
    if (res != null) {
      var salesData = MeterReadingModel.fromJson(res);
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
