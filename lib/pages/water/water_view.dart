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
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.invoiceAll.length,
                  itemBuilder: (context, index) {
                    return WaterPendingCard(
                      subTitle: "Test",
                      title: controller.invoiceAll[index].name,
                      month: "May",
                      color: Colors.blue,
                      date: controller.invoiceAll[index].date_of_entry,
                      dueAmount:
                          "${controller.invoiceAll[index].invoiced_amount}",
                      invoiceType: "Water",
                    );
                  })
            ],
          ),
        ));
  }
}
