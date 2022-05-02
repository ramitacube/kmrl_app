import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/header_widget.dart';
import 'package:kmrl_connect_to_business/widgets/helpCard.dart';
import 'package:kmrl_connect_to_business/widgets/subHeader.dart';

import 'help_controller.dart';

class HelpView extends GetView<HelpController> {
  HelpView() {
    Get.put(HelpController());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.helpScaffoldKey,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        // bottomNavigationBar: BottomNavBar(),
        appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
            child: HeaderTitle(onTapped: () => Get.toNamed(Routes.PROFILE))),
        body: SingleChildScrollView(
          child: GetBuilder<HelpController>(builder: (controller) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SubHeaderTitle(
                      title: 'Help Desk',
                      subTitle: 'Grievances & Support',
                      image: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: KmrlIcons.helpDeskBig(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.ADDTICKET);
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
                    itemCount: controller.ticketList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (contextList, index) {
                      return HelpCard(
                          title: '${controller.ticketList[index].name}',
                          subTitle:
                              'on ${controller.formatDate(controller.ticketList[index].openingDate)}',
                          onTap: () {},
                          color: yellowColor,
                          invoiceType: '${controller.ticketList[index].status}',
                          date: '${controller.ticketList[index].openingDate}',
                          description:
                              '${controller.ticketList[index].description}',
                          issueType:
                              '${controller.ticketList[index].issueType}',
                          paidExpanded: controller.paidExpanded);
                    })
              ],
            );
          }),
        ));
  }
}
