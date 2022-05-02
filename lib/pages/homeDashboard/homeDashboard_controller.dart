import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kmrl_connect_to_business/models/contract_list_model.dart';
import 'package:kmrl_connect_to_business/models/customer_model.dart';
import 'package:kmrl_connect_to_business/models/sales_invoice_model.dart';
import 'package:kmrl_connect_to_business/network/base_controller.dart';
import 'package:kmrl_connect_to_business/network/endpoints.dart';

class HomeDashboardController extends BaseController {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final bool paidExpanded = false;
  bool expanded = false;
  var bottomNavIndex = 0;
  late String value;
  late var mobile = sharedPreferenceHelper.mobile;
  List<InvoiceList> pendingInvoice = [];
  List<ContractData> contractList = [];
  List<CustomerData> customerList = [];
  final GlobalKey<ScaffoldState> key = GlobalKey();
  // List<String> contractMaterialNo = [];
  // List<String> contractSpaceLoc = [];

  HomeDashboardController() {
    getCustomer();
    // getPendingInvoices();
  }
  updateBottomNavIndex(var index) {
    bottomNavIndex = index;
    update();
  }

  late String customerName = customerList[0].name;
  Future<void> getPendingInvoices(var cName) async {
    await Future.delayed(Duration(milliseconds: 100));
    showLoading();
    String pendingInvoicefilter =
        'filters=[["customer","=","$cName"],["status","=","Overdue"]]';
    var res = await apiClient
        .get("${EndPoints.salesInvoicePending}&$pendingInvoicefilter");
    print("INVOICE==${EndPoints.salesInvoicePending}");
    if (res != null) {
      var salesData = SalesInvoiceModel.fromJson(res);
      pendingInvoice = salesData.data;
      update();
    }
    hideLoading();
  }

  Future<void> getContractList(var cName) async {
    String filter =
        '&filters=[["status","=","Active"],["party_name","=","$cName"]]';
    await Future.delayed(Duration(milliseconds: 100));
    showLoading();

    print("${EndPoints.contractListActive}$filter");
    var res = await apiClient.get("${EndPoints.contractListActive}$filter");
    if (res != null) {
      var salesData = ContractList.fromJson(res);
      contractList = salesData.data;
      update();
    }
    hideLoading();
    // contractSpaceLoc.clear();
    // contractMaterialNo.clear();
    // for (int i = 0; i < contractList.length; i++) {
    //   contractMaterialNo.add(contractList[i].materialNo!);
    //   contractSpaceLoc.add(contractList[i].spaceLocation!);
    // }
  }

  Future<void> getCustomer() async {
    await Future.delayed(Duration(milliseconds: 200)).then((value) {});

    showLoading();
    await checkLogin();
    var res = await apiClient
        .get('${EndPoints.getCustomer}&filters=[["mobile_no","=","$mobile"]]');

    if (res != null) {
      var customer = Customer.fromJson(res);
      customerList = customer.data;
      await sharedPreferenceHelper.updateUser(
          customerList[0].name, customerList[0].emailId);
      getContractList(customerList[0].name);
      getPendingInvoices(customerList[0].name);
      print(customerList[0].name);

      update();
    }
    hideLoading();
  }

  getMonthyear(String? date) {
    if (date == null) {
      return "";
    }
    var formated = DateFormat("yyyy-mm-dd").parse(date);
    return DateFormat("MMM-yy").format(formated);
  }
}
