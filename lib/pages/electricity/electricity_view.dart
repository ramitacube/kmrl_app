import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.invoiceAll.length,
                  itemBuilder: (context, index) {
                    final due_d = DateFormat("yyyy-mm-dd")
                        .parse(controller.invoiceAll[index].date_of_entry)
                        .add(Duration(days: 10));
                    final due_date = DateFormat("dd-mm-yyyy").format(due_d);
                    return ElectricityPendingCard(
                        subTitle: controller.invoiceAll[index].name,
                        title: controller.invoiceAll[index].name,
                        month: "May",
                        date: due_date,
                        dueAmount:
                            "${controller.invoiceAll[index].invoiced_amount}",
                        invoiceType: "Pending");
                  })
            ],
          ),
        ));
  }
}
