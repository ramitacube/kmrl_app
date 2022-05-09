import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:kmrl_connect_to_business/pages/homeDashboard/homeDashboard_controller.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:dotted_border/dotted_border.dart';

class PendingInvoicesWidget extends StatelessWidget {
  const PendingInvoicesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return GetBuilder<HomeDashboardController>(builder: (controller) {
      return controller.pendingInvoice.length == 0
          ? Container()
          : Container(
              margin: EdgeInsets.only(
                  top: h * 0.05, left: w * 0.05, right: w * 0.05),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(15),
                color: lightGreenColor,
                dashPattern: [4, 2],
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: h * 0.22,
                      aspectRatio: 2,
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 30)),
                  items: controller.pendingInvoice.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.black12,
                                blurRadius: 1,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: kLightPrimaryColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: w * 0.05),
                                      child: Text(
                                          'Pending Invoices as on ${DateFormat('MMM yyyy').format(DateTime.now())}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: darkBlueColor,
                                                  fontSize: 16)),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            'assets/images/close.png',
                                            height: 25,
                                            width: 25,
                                          ),
                                        ))
                                  ],
                                ),
                              ),

                              Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 0.05),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: h * 0.01),
                                      child: Text('${i.itemName}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  color: darkBlueColor,
                                                  fontSize: 18)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          buildBox(context,
                                              color: i.status == 'Overdue'
                                                  ? darkRedColor
                                                  : lightGreenColor,
                                              invoiceType: i.status),
                                          Text(
                                              i.status != ''
                                                  ? 'Due on ${i.dueDate}'
                                                  : 'Due on ${i.dueDate}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 12,
                                                      color: lightGreenColor)),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      // padding: EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('₹ ${i.outstandingAmount}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: darkBlueColor,
                                                          fontSize: 18)),
                                              Text('Inclusive of all taxes',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: darkBlueColor,
                                                      )),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              debugPrint('PAY');
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: w * 0.05,
                                                  vertical: h * 0.01),
                                              decoration: BoxDecoration(
                                                  color: lightGreenColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Text('PAY',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText2!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: darkBlueColor,
                                                      )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Text('${i.spaceLocation ?? ""}',
                              //     style:
                              //         Theme.of(context).textTheme.bodyText2!.copyWith(
                              //               fontWeight: FontWeight.normal,
                              //               color: darkBlueColor,
                              //             )),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            );
    });
  }

  Widget buildBox(BuildContext context, {Color? color, String? invoiceType}) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.width * 0.01),
        margin:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02),
        width: MediaQuery.of(context).size.width * 0.18,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text('$invoiceType',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  color: Colors.white)),
        ));
  }
}
