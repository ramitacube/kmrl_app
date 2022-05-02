import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kmrl_connect_to_business/pages/homeDashboard/homeDashboard_controller.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:dotted_border/dotted_border.dart';

class PendingInvoices extends StatelessWidget {
  const PendingInvoices({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return GetBuilder<HomeDashboardController>(builder: (controller) {
      return Card(
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Colors.black26, width: 1),
        ),
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.width * 0.05),
        child: CarouselSlider(
          options: CarouselOptions(
              aspectRatio: 2,
              viewportFraction: 1,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4)),
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
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.05, vertical: 0),
                        child: Container(
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Pending Invoices',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: darkBlueColor,
                                          fontSize: 18)),
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset(
                                    'assets/images/close.png',
                                    height: 25,
                                    width: 25,
                                  ))
                            ],
                          ),
                        ),
                      ),
                      DottedBorder(
                        customPath: (size) {
                          return Path()
                            ..moveTo(0, 5)
                            ..lineTo(size.width, 5);
                        },
                        dashPattern: [6, 4],
                        strokeWidth: 2.0,
                        color: Color(0xff696D6E80).withOpacity(0.5),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: w * 0.04,
                          right: w * 0.04,
                          bottom: w * 0.0,
                        ),
                        margin: EdgeInsets.only(top: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: lightGreenColor,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(i.dueDate.split("-")[2],
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: darkBlueColor,
                                          )),
                                  Text(controller.getMonthyear(i.dueDate),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: darkBlueColor,
                                          )),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('₹ 21,000',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1!
                                        .copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: darkBlueColor,
                                            fontSize: 16)),
                                Text('Inclusive of all taxes',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          fontWeight: FontWeight.normal,
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
                                    horizontal: w * 0.05, vertical: h * 0.005),
                                decoration: BoxDecoration(
                                    color: lightGreenColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text('PAY',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: darkBlueColor,
                                        )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
      );
    });
  }
}
