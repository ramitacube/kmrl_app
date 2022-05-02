import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/electricity/elecPaidCard.dart';
import 'package:kmrl_connect_to_business/widgets/electricity/elecPendingCard.dart';
import 'package:kmrl_connect_to_business/widgets/header_widget.dart';
import 'package:kmrl_connect_to_business/widgets/subHeader.dart';

import 'electricity_controller.dart';

class ElectricityView extends GetView<ElectricityController> {
  final bool disableBack;

  ElectricityView({required this.disableBack}) {
    Get.put(ElectricityController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.scaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
            child: HeaderTitle(
              onTapped: () => Get.toNamed(Routes.PROFILE),
              disableBack: disableBack,
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SubHeaderTitle(
                title: 'Pay Electricity Bill',
                subTitle: '2 Active Connections',
                image: KmrlIcons.bulbBig(),
              ),
              ElectricityPendingCard(
                title: '157757006020',
                subTitle: 'Due on 16 Nov 2021',
                color: darkRedColor,
                invoiceType: 'Overdue',
                date: '05 Dec 2021',
                month: '12 2021',
                dueAmount: '4,025.00',
              ),
              ElectricityPaidCard(
                  title: '1154325006186',
                  subTitle: 'on 05 Dec 2021',
                  color: lightGreenColor,
                  invoiceType: 'Paid',
                  date: '21 Nov 2021',
                  dueAmount: '4,056.00',
                  month: '11 2021'),
            ],
          ),
        ));
  }
}
