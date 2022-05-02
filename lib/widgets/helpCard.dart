import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';

import 'colorText.dart';

class HelpCard extends StatelessWidget {
  HelpCard(
      {Key? key,
      required this.subTitle,
      required this.title,
      required this.onTap,
      required this.color,
      required this.date,
      required this.issueType,
      required this.description,
      required this.paidExpanded,
      required this.invoiceType})
      : super(key: key);
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final Color color;
  final String invoiceType;
  final String date;
  final String issueType;
  final String description;
  bool paidExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.08,
          right: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.width * 0.05),
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
      child: ExpansionTile(
        onExpansionChanged: (val) {
          paidExpanded = val;
        },
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40), color: kPrimaryColor),
          child: Center(
            child: Text('N',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w400)),
          ),
        ),
        title: Text('$title',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [
            buildBox(context, color: color),
            // Text('# $ticketNo  ',
            //     style: Theme.of(context).textTheme.bodyText2!.copyWith(
            //         fontWeight: FontWeight.w400,
            //         fontSize: 12,
            //         color: kPrimaryColor)),
            Text('$date',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: kPrimaryColor)),
          ],
        ),
        trailing: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: lightBlueColor.withOpacity(0.3),
          ),
          child: Icon(
            paidExpanded
                ? Icons.keyboard_arrow_down
                : Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 20,
          ),
        ),
        children: [
          Container(
              // color: Colors.red,
              // height: 50,
              width: double.infinity,
              // padding: EdgeInsets.only(
              //   left: MediaQuery.of(context).size.width * 0.18,
              // ),
              // vertical: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08,
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: Text('Issue Type: $issueType',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 12)),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.08,
                        top: MediaQuery.of(context).size.height * 0.01,
                        bottom: MediaQuery.of(context).size.height * 0.01),
                    child: Text('Description: $description',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 12)),
                  ),
                  // styleRichText(
                  //   'Receipt No :',
                  //   'Bank/P2A/ICICI/0000098',
                  //   Theme.of(context).textTheme.subtitle2!.copyWith(
                  //       fontWeight: FontWeight.w400,
                  //       color: Colors.black,
                  //       fontSize: 10),
                  //   Theme.of(context).textTheme.subtitle2!.copyWith(
                  //       fontWeight: FontWeight.w300,
                  //       color: kPrimaryColor,
                  //       fontSize: 10),
                  // ),
                ],
              ))
        ],
      ),
    );
  }

  Widget buildBox(BuildContext context, {Color? color}) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.width * 0.01),
        margin:
            EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.02),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: Text('$invoiceType',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                fontSize: 10,
                overflow: TextOverflow.fade,
                fontWeight: FontWeight.w300,
                color: Colors.white)));
  }
}
