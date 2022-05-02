import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/header_widget.dart';
import 'package:kmrl_connect_to_business/widgets/invoice/invoicePaidCard.dart';
import 'package:kmrl_connect_to_business/widgets/invoice/invoicePendingCard.dart';
import 'package:kmrl_connect_to_business/widgets/statement.dart';
import 'package:kmrl_connect_to_business/widgets/subHeader.dart';

import 'invoice_controller.dart';

class InvoiceView extends GetView<InvoiceController> {
  final bool disableBack;

  InvoiceView({required this.disableBack}) {
    Get.put(InvoiceController());
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
          child: GetBuilder<InvoiceController>(builder: (controller) {
            return Column(
              children: [
                SubHeaderTitle(
                  title: 'Invoice Generated',
                  subTitle: '2 Unpaid Invoices',
                  image: KmrlIcons.invoiceBig(),
                ),
                Statement(),
                ListView.builder(
                    itemCount: controller.invoiceAll.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (contextList, index) {
                      final invoiceData = controller.invoiceAll[index];
                      if (controller.invoiceAll[index].status == "Paid") {
                        return InvoicePaidCard(
                          title: invoiceData.name,
                          subTitle:
                              'Due on ${controller.formatDate(invoiceData.dueDate)}',
                          color: lightGreenColor,
                          invoiceType: 'Paid',
                          date: controller.formatDate(invoiceData.dueDate),
                          month: controller.formatMonth(invoiceData.dueDate),
                          dueAmount: invoiceData.grandTotal,
                        );
                      } else {
                        return InvoicePendingCard(
                          title: invoiceData.name,
                          subTitle:
                              'Due on ${controller.formatDate(invoiceData.dueDate)}',
                          color: yellowColor,
                          invoiceType: 'Upcoming',
                          date: controller.formatDate(invoiceData.dueDate),
                          dueAmount: invoiceData.outstandingAmount,
                          month: controller.formatMonth(invoiceData.dueDate),
                        );
                      }
                    }),
              ],
            );
          }),
        ));
  }
}
