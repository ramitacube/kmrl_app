import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kmrl_connect_to_business/models/sales_invoice_model.dart';
import 'package:kmrl_connect_to_business/network/base_controller.dart';
import 'package:kmrl_connect_to_business/network/endpoints.dart';

class InvoiceController extends BaseController {
  List<InvoiceList> invoiceAll = [];
  final bool expanded = false;
  final bool paidExpanded = false;
  var filterFromLease;
  @override
  Future<void> onInit() async {
    await super.onInit();
    filterFromLease = Get.arguments;
    getPendingInvoices();
  }

  Future<void> getPendingInvoices() async {
    var name = sharedPreferenceHelper.name;
    print(name);
    await Future.delayed(Duration(milliseconds: 100));
    showLoading();

    var filters = filterFromLease == null
        ? '&filters=[["customer","=","$name"]]'
        : '&filters=[["material_no","=","$filterFromLease"]]';
    var res = await apiClient.get("${EndPoints.salesInvoiceAll}$filters");
    if (res != null) {
      var salesData = SalesInvoiceModel.fromJson(res);
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
