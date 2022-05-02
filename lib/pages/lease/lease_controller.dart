import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/models/lease_details.dart';
import 'package:kmrl_connect_to_business/models/lease_model.dart';
import 'package:kmrl_connect_to_business/network/base_controller.dart';
import 'package:kmrl_connect_to_business/network/endpoints.dart';

class LeaseController extends BaseController {
  var scrollController = ScrollController();
  var expanded = false;
  List<LeaseData> leastAccountList = [];
  LeaseDetails? leaseDetails;
  LeaseController() {
    getLeaseAccounts();
  }
  Future<void> getLeaseAccounts() async {
    await Future.delayed(Duration(milliseconds: 100));
    showLoading();

    var res = await apiClient.get(EndPoints.leaseListActive);
    if (res != null) {
      var contractData = LeaseContracts.fromJson(res);

      leastAccountList = contractData.data;

      update();
    }
    hideLoading();
  }

  Future<void> getLeaseDetails(var index) async {
    await Future.delayed(Duration(milliseconds: 100));
    showLoading();

    var res = await apiClient
        .get("${EndPoints.getContactDetails}${leastAccountList[index].name}");
    if (res != null) {
      leaseDetails = LeaseDetails.fromJson(res);
      update();
    }
    hideLoading();
  }
}
