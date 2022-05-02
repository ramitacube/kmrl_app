import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/pages/lease/lease_controller.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/header_widget.dart';
import 'package:kmrl_connect_to_business/widgets/lease_widget.dart';
import 'package:kmrl_connect_to_business/widgets/subHeader.dart';

import 'lease_controller.dart';

class LeaseView extends GetView<LeaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        // bottomNavigationBar: BottomNavBar(),
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
            child: HeaderTitle()),
        body: GetBuilder<LeaseController>(builder: (controller) {
          return SingleChildScrollView(
            controller: controller.scrollController,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SubHeaderTitle(
                  title: 'Lease Accounts',
                  subTitle:
                      '${controller.leastAccountList.length} Active Rentals',
                  image: KmrlIcons.leaseBig(),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.leastAccountList.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (Get.arguments != null &&
                          controller.leastAccountList[index].materialNo ==
                              Get.arguments["material_no"]) {
                        // controller.scrollController.animateTo(
                        //     80.toDouble() * index,
                        //     duration: Duration(seconds: 1),
                        //     curve: Curves.fastOutSlowIn);
                        controller.scrollController
                            .jumpTo(80.toDouble() * index);
                      }
                      return LeaseWidget(
                          leaseData: controller.leastAccountList[index],
                          onTapLease: () {
                            Get.toNamed(Routes.LEASEDETAILS);
                            controller.getLeaseDetails(index);
                          },
                          onTapInvoice: () {
                            Get.toNamed(Routes.INVOICE, arguments: {
                              "material_no": controller
                                  .leastAccountList[index].materialNo
                                  .toString()
                            });
                          });
                    })
              ],
            ),
          );
        }));
  }
}
