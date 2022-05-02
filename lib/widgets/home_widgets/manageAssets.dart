import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kmrl_connect_to_business/routes/app_routes.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';

class ManageAssets extends StatelessWidget {
  const ManageAssets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
        left: w * 0.1,
        top: w * 0.05,
        right: w * 0.1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Text('Manage My Leased Assets',
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
                      buildAsset(context, onTapped: () {
                        Get.toNamed(Routes.LEASE);
                      },
                          text1: 'Lease',
                          text2: 'Accounts',
                          image: KmrlIcons.leaseVeryBig()),
                      buildAsset(context, onTapped: () {
                        Get.toNamed(Routes.INVOICE);
                      },
                          text1: 'Invoices',
                          text2: 'Generated',
                          image: KmrlIcons.invoiceVeryBig()),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildAsset(context, onTapped: () {
                      Get.toNamed(Routes.PAYMENT);
                    },
                        text1: 'Payment',
                        text2: '&Receipts',
                        image: KmrlIcons.paymentVeryBig()),
                    buildAsset(context, onTapped: () {
                      Get.toNamed(Routes.BALANCE);
                    },
                        text1: 'Balance',
                        text2: '&History',
                        image: KmrlIcons.balanceVeryBig())
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildAsset(BuildContext context,
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
