import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/pages/lease/lease_controller.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';
import 'package:kmrl_connect_to_business/widgets/header_widget.dart';
import 'package:kmrl_connect_to_business/widgets/subHeader.dart';

import 'leaseDetails_controller.dart';

class LeaseDetailsView extends GetView<LeaseController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LeaseController>(
        initState: maininit(),
        builder: (_) => Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            // bottomNavigationBar: BottomNavBar(),
            appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.12),
                child:
                    HeaderTitle(onTapped: () => Get.toNamed(Routes.PROFILE))),
            body: GetBuilder<LeaseController>(builder: (controller) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SubHeaderTitle(
                      title: 'Lease Accounts',
                      subTitle:
                          '${controller.leastAccountList.length} Active Rentals',
                      image: KmrlIcons.leaseBig(),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width * 0.05,
                        left: MediaQuery.of(context).size.width * 0.05,
                        right: MediaQuery.of(context).size.width * 0.05,
                      ),
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.08,
                          right: MediaQuery.of(context).size.width * 0.1,
                          top: MediaQuery.of(context).size.width * 0.05,
                          bottom: MediaQuery.of(context).size.width * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 1.5),
                            color: Colors.black26,
                            blurRadius: 3,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.leaseDetails?.data.name ?? "",
                            style: Theme.of(context).textTheme.headline4,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            controller.leaseDetails?.data.spaceLocation ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(fontSize: 12),
                          ),
                          Text(
                              '\n\nCompany : ${controller.leaseDetails?.data.owner ?? ""}'),
                          Text(
                              'Property : ${controller.leaseDetails?.data.name ?? ""} \n'),
                          Text(
                              'Lease Date : ${controller.leaseDetails?.data.loaDate ?? ""}'),
                          Text(
                              'Lease Status : ${controller.leaseDetails?.data.status ?? ""}'),
                          Text(
                              'Start Date : ${controller.leaseDetails?.data.startDate ?? ""}'),
                          Text(
                              'End Date : ${controller.leaseDetails?.data.endDate ?? ""}\n'),
                          Text('Frequency : Monthly'),
                          Text(
                              'Days to invoice in advance: ${controller.leaseDetails?.data.noticePeriod ?? ""} days'),
                          Text(
                              'Notice Period: ${controller.leaseDetails?.data.noticePeriod ?? ""} days'),
                          Text(
                              'Fit out Period: ${controller.leaseDetails?.data.fitmentPeriod ?? ""} days\n'),
                          Text('Security Deposit Currency : INR'),
                          Text(
                              'Security deposit : ₹ ${controller.leaseDetails?.data.securityDeposit ?? ""}'),
                          Text('Security Status : Received\n'),
                          Text(
                              'Late payment interest percentage :  ${controller.leaseDetails?.data.interestPercentage ?? ""}%'),
                          Text(
                              "WTax paid by:  By Lessee (${controller.leaseDetails?.data.owner ?? ""})")
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.05,
                        top: MediaQuery.of(context).size.width * 0.03,
                        // bottom: MediaQuery.of(context).size.width * 0.05
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          KmrlIcons.pdfIcon(),
                          Container(
                            margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Click here to download the',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                ),
                                TextButton(
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all<
                                              EdgeInsetsGeometry?>(
                                          EdgeInsets.only(left: 5, right: 5))),
                                  onPressed: () {
                                    debugPrint('PDF');
                                  },
                                  child: Text(
                                    'PDF Version',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        ?.copyWith(
                                          fontSize: 14,
                                          color: kPrimaryColor,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            })));
  }

  maininit() {
    Get.put<LeaseDetailsController>(LeaseDetailsController());
  }
}
