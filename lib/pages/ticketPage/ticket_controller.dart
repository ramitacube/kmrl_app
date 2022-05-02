import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/models/ticket_model.dart';
import 'package:kmrl_connect_to_business/network/base_controller.dart';
import 'package:kmrl_connect_to_business/network/endpoints.dart';

class TicketController extends BaseController {
  final GlobalKey<ScaffoldState> ticketScaffoldKey =
      new GlobalKey<ScaffoldState>();
  final ticketFormKey = GlobalKey<FormState>();
  final items = ['Technical', 'Billing'];
  List<TicketData> ticketList = [];

  String? category;
  String? description;

  void submitTicket() {
    if (category == null) {
      return showSnackBar("Please selecte a Category");
    } else {
      if (ticketFormKey.currentState?.validate() == true) {
        _submitTicketApi();
      }
    }
  }

  Future<void> _submitTicketApi() async {
    await Future.delayed(Duration(milliseconds: 100));
    showLoading();

    var data = {
      "data": {
        "subject": "$category",
        "raised_by": sharedPreferenceHelper.email,
        "status": "Open",
        "issue_type": "Billing",
        "description": "$description",
        "doctype": "Issue"
      }
    };
    var res = await apiClient.post("${EndPoints.createTicket}", body: data);
    if (res != null) {
      showSnackBar("Issue Created Successfully",
          title: "Succeess", isSuccess: true);
      _clearData();
      getTickets();
    }
    hideLoading();
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

  _clearData() {
    description = null;
    category = null;
    update();
  }

  @override
  Future onInit() async {
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
}
