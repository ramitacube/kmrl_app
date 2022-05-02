import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/pages/bottomNav/bottomnavBar.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/header_widget.dart';
import 'package:kmrl_connect_to_business/widgets/invoice/paidInvoice.dart';
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
              PendingInvoiceCard(
                title: 'KMT4769D',
                subTitle: 'Due on 14 Nov 2021',
                onTap: () {},
                color: darkRedColor,
                invoiceType: 'Overdue',
                date: '14 Nov 2021',
                dueAmount: '625.00',
              ),
              PendingInvoiceCard(
                title: 'WYV10098',
                subTitle: 'Processing, Due on 05 Nov 2021',
                onTap: () {},
                color: darkRedColor,
                invoiceType: '',
                date: '05 Dec 2021',
                dueAmount: '625.00',
              ),
              PaidInvoiceCard(
                  title: 'WYV10076',
                  subTitle: 'on 04 Oct 2021',
                  onTap: () {},
                  color: lightGreenColor,
                  invoiceType: 'Paid',
                  date: '21 Sep 2021',
                  dueAmount: '686.00',
                  paidExpanded: controller.paidExpanded),
              PaidInvoiceCard(
                  title: 'WYV10054',
                  subTitle: 'on 21 Sep 2021',
                  onTap: () {},
                  color: lightGreenColor,
                  invoiceType: 'Paid',
                  date: '21 Sep 2021',
                  dueAmount: '675.00',
                  paidExpanded: controller.paidExpanded),
            ],
          ),
        ));
  }
}
