import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/header_widget.dart';
import 'package:kmrl_connect_to_business/widgets/invoice/pendingInvoiceCard.dart';
import 'package:kmrl_connect_to_business/widgets/subHeader.dart';

import 'meter_controller.dart';

class MeterView extends GetView<MeterController> {
  final bool disableBack;

  MeterView({required this.disableBack}) {
    Get.put(MeterController());
  }

  @override
  Widget build(BuildContext context) {
    print(controller);
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SubHeaderTitle(
                    title: 'Meter Reading',
                    subTitle: '2 Active Amenities',
                    image: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: KmrlIcons.meterBig(),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.ADDMETER);
                        },
                        borderRadius: BorderRadius.circular(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset('assets/images/chatPlus.png'),
                            Text('New',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        fontSize: 10, color: kPrimaryColor))
                          ],
                        )),
                  )
                ],
              ),
              ListView.builder(
                  itemCount: controller.invoiceAll.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final bill_date_parse = DateFormat("yyyy-mm-dd")
                        .parse(controller.invoiceAll[index].date_of_entry);
                    final bill_date =
                        DateFormat("dd-mm-yyyy").format(bill_date_parse);

                    final due_d = DateFormat("yyyy-mm-dd")
                        .parse(controller.invoiceAll[index].date_of_entry)
                        .add(Duration(days: 10));
                    final due_date = DateFormat("dd-mm-yyyy").format(due_d);
                    return PendingInvoiceCard(
                        subTitle: controller.invoiceAll[index].name,
                        title: controller.invoiceAll[index].name,
                        onTap: () {},
                        color: Colors.green,
                        dueAmount:
                            "${controller.invoiceAll[index].invoiced_amount}",
                        billing_date: bill_date,
                        due_date: "$due_date",
                        invoiceType: controller.invoiceAll[index].reading_type);
                  })
            ],
          ),
        ));
  }
}
