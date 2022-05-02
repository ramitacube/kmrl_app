import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/header_widget.dart';
import 'package:kmrl_connect_to_business/widgets/statement.dart';
import 'package:kmrl_connect_to_business/widgets/subHeader.dart';

import 'balance_controller.dart';

class BalanceView extends GetView<BalanceController> {
  BalanceView() {
    Get.put(BalanceController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.balScaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        // bottomNavigationBar: BottomNavBar(),
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
            child: HeaderTitle(onTapped: () => Get.toNamed(Routes.PROFILE))),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SubHeaderTitle(
                title: 'Invoice Generated',
                subTitle: '2 Unpaid Invoices',
                image: KmrlIcons.invoiceBig(),
              ),
              Statement(),
            ],
          ),
        ));
  }
}
