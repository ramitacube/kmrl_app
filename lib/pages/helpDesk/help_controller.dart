import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kmrl_connect_to_business/models/ticket_model.dart';
import 'package:kmrl_connect_to_business/network/base_controller.dart';
import 'package:kmrl_connect_to_business/network/endpoints.dart';

class HelpController extends BaseController {
  final GlobalKey<ScaffoldState> helpScaffoldKey =
      new GlobalKey<ScaffoldState>();
  final bool expanded = false;
  final bool paidExpanded = false;
  List<TicketData> ticketList = [];

  Future<void> onInit() async {
    await super.onInit();
    // filterFromLease = Get.arguments;
    getTickets();
  }

  Future<void> getTickets() async {
    var email = sharedPreferenceHelper.email;

    await Future.delayed(Duration(milliseconds: 100));
    showLoading();

    var filters = '&filters=[["owner","=","$email"]]';
    var res = await apiClient.get("${EndPoints.getTicket}$filters");
    if (res != null) {
      var ticketData = TicketModel.fromJson(res);
      ticketList = ticketData.data;
      update();
    }
    hideLoading();
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
}
