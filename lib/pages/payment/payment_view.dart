import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/pages/bottomNav/bottomnavBar.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/header_widget.dart';
import 'package:kmrl_connect_to_business/widgets/invoice/paidInvoice.dart';
import 'package:kmrl_connect_to_business/widgets/invoice/pendingInvoiceCard.dart';
import 'package:kmrl_connect_to_business/widgets/statement.dart';
import 'package:kmrl_connect_to_business/widgets/subHeader.dart';

import 'payment_controller.dart';

class PaymentsView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        // bottomNavigationBar: BottomNavBar(),
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
            child: HeaderTitle(onTapped: () => Get.toNamed(Routes.PROFILE))),
        body: SingleChildScrollView(
          child: GetBuilder<PaymentController>(builder: (controller) {
            return Column(
              children: [
                SubHeaderTitle(
                  title: 'Payments & Receipts',
                  subTitle: '1 Receipt on Process',
                  image: KmrlIcons.paymentBig(),
                ),
                ListView.builder(
                    itemCount: controller.paymentList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (contextList, index) {
                      final invoiceData = controller.paymentList[index];
                      if (controller.paymentList[index].status == "Paid") {
                        return PaidInvoiceCard(
                            title: invoiceData.name,
                            subTitle:
                                'on ${controller.formatDate(invoiceData.postingDate)}',
                            onTap: () {},
                            color: lightGreenColor,
                            invoiceType: 'Paid',
                            date:
                                controller.formatDate(invoiceData.postingDate),
                            dueAmount: invoiceData.paidAmount,
                            paidExpanded: controller.paidExpanded);
                      } else {
                        return PendingInvoiceCard(
                          title: invoiceData.name,
                          subTitle:
                              'on ${controller.formatDate(invoiceData.postingDate)}',
                          onTap: () {},
                          color: yellowColor,
                          invoiceType: '',
                          date: controller.formatDate(invoiceData.postingDate),
                          dueAmount: invoiceData.paidAmount,
                        );
                      }
                    }),
              ],
            );
          }),
        ));
  }

  /*
  return PaidInvoiceCard(
                            title: invoiceData.name ?? "",
                            subTitle:
                                'on ${controller.formatDate(invoiceData.postingDate)}',
                            onTap: () {},
                            color: lightGreenColor,
                            invoiceType: 'Paid',
                            date:
                                controller.formatDate(invoiceData.postingDate),
                            dueAmount: invoiceData.paidAmount ?? "",
                            paidExpanded: controller.paidExpanded);
                      } else {
                        return PendingInvoiceCard(
                          title: invoiceData.name ?? "",
                          subTitle:
                              'on ${controller.formatDate(invoiceData.postingDate)}',
                          onTap: () {},
                          color: yellowColor,
                          invoiceType: 'Upcoming',
                          date: controller.formatDate(invoiceData.postingDate),
                          dueAmount: invoiceData.paidAmount ?? "",
                        );
  */
}
