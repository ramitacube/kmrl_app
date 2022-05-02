import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';

class WaterPaidCard extends StatefulWidget {
  WaterPaidCard({
    Key? key,
    required this.subTitle,
    required this.title,
    required this.month,
    required this.color,
    required this.date,
    required this.dueAmount,
    required this.invoiceType,
    this.onExpansionChanged,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final String month;
  final Color color;
  final String invoiceType;
  final String date;
  final String dueAmount;
  final onExpansionChanged;

  @override
  State<StatefulWidget> createState() => _StatePend();
}

class _StatePend extends State<WaterPaidCard> {
  var expanded = false;
  bool checkBox = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.08,
          right: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.height * 0.01),
            decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Text(
              'Rental Invoice for the month of ${widget.month}',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.height * 0.01,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('${widget.title}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontWeight: FontWeight.bold)),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '₹ ${widget.dueAmount}',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: darkBlueColor,
                                    fontSize: 18),
                          ),
                          Text(
                            'inclusive of all taxes',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: darkBlueColor,
                                    fontSize: 10),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildBox(context, color: widget.color),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Text(
                              widget.invoiceType != ''
                                  ? 'Due on ${widget.date}'
                                  : 'Processing, Done on ${widget.date}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: lightGreyColor)),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ref# 1007GH0000123',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: darkBlueColor, fontSize: 10),
                            ),
                            Text(
                              'Bank: IOB Calicut',
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2!
                                  .copyWith(color: darkBlueColor, fontSize: 10),
                            )
                          ]),
                    )
                  ],
                ),
              ],
            ),
          ),
          Visibility(
              visible: widget.invoiceType == "Upcoming" ? true : false,
              child: CheckboxListTile(
                value: checkBox,
                dense: true,
                contentPadding: EdgeInsets.zero,
                checkColor: Colors.white,
                activeColor: kPrimaryColor,
                controlAffinity: ListTileControlAffinity.leading,
                title: Transform.translate(
                    offset: const Offset(-20, 0),
                    child: Text(
                      'Mark if Paid Extenally',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontSize: 12,
                          color: lightGreenColor,
                          fontWeight: FontWeight.w400),
                    )),
                onChanged: (value) {
                  setState(() {
                    checkBox = value!;
                  });
                },
              ))
        ],
      ),
    );
  }

  Widget buildBox(BuildContext context, {Color? color}) {
    return widget.invoiceType != ''
        ? Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: MediaQuery.of(context).size.width * 0.01),
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.02),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(15)),
            child: Text('${widget.invoiceType}',
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: Colors.white)))
        : SizedBox();
  }
}
