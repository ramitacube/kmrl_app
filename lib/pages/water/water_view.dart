import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/header_widget.dart';
import 'package:kmrl_connect_to_business/widgets/subHeader.dart';
import 'package:kmrl_connect_to_business/widgets/water/waterPaid.dart';
import 'package:kmrl_connect_to_business/widgets/water/waterPendingCard.dart';

import 'water_controller.dart';

class WaterView extends GetView<WaterController> {
  final bool disableBack;

  WaterView({required this.disableBack}) {
    Get.put(WaterController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.waterScaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        // bottomNavigationBar: BottomNavBar(),
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
                title: 'Pay Water Bill',
                subTitle: '2 Active Connections',
                image: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: KmrlIcons.waterBig(),
                ),
              ),
              WaterPendingCard(
                title: 'KMT/4769/D',
                subTitle: 'Due on 14 Nov 2021',
                color: darkRedColor,
                invoiceType: 'Overdue',
                date: '05 Dec 2021',
                month: '12 2021',
                dueAmount: '625.00',
              ),
              WaterPaidCard(
                  title: 'NEM/7085/D',
                  subTitle: 'on 15 Oct 2021',
                  color: lightGreenColor,
                  invoiceType: 'Paid',
                  date: '21 Nov 2021',
                  dueAmount: '665.00',
                  month: '11 2021'),
            ],
          ),
        ));
  }
}
