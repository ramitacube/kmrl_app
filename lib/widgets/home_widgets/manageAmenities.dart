import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';

class ManageAmenities extends StatelessWidget {
  const ManageAmenities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
          left: w * 0.1, top: w * 0.05, right: w * 0.1, bottom: w * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Text('Manage your Amenities',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w700)),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildAmenity(context, onTapped: () {
                        Get.toNamed(Routes.ELECTRICITY);
                      },
                          text1: 'Electricity',
                          text2: 'Bill',
                          image: KmrlIcons.bigBulb()),
                      buildAmenity(context, onTapped: () {
                        Get.toNamed(Routes.WATER);
                      },
                          text1: 'Water',
                          text2: 'Bill',
                          image: KmrlIcons.waterVeryBig()),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildAmenity(context, onTapped: () {
                      Get.toNamed(Routes.METER);
                    },
                        text1: 'Meter',
                        text2: 'Readings',
                        image: KmrlIcons.meterVeryBig()),
                    buildAmenity(context, onTapped: () {
                      Get.toNamed(Routes.HELPDESK);
                    },
                        text1: 'Help Desk',
                        text2: '',
                        image: KmrlIcons.helpDeskVeryBig())
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildAmenity(BuildContext context,
      {required String text1,
      required String text2,
      required Widget image,
      required VoidCallback onTapped}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.05),
          child: InkWell(
            onTap: onTapped,
            borderRadius: BorderRadius.circular(15),
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(15),
              color: lightGreenColor,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    image,
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text('$text1'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text('$text2'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
