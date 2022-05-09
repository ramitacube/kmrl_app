import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';

import '../halfPayButton.dart';

class PendingInvoiceCard extends StatefulWidget {
  PendingInvoiceCard({
    Key? key,
    required this.subTitle,
    required this.title,
    required this.onTap,
    required this.color,
    required this.billing_date,
    required this.due_date,
    required this.dueAmount,
    required this.invoiceType,
    this.onExpansionChanged,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final VoidCallback onTap;
  final Color color;
  final String invoiceType;
  final String billing_date;
  final String due_date;
  final String dueAmount;
  final onExpansionChanged;

  @override
  State<StatefulWidget> createState() => _StatePend();
}

class _StatePend extends State<PendingInvoiceCard> {
  var expanded = false;
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
        onExpansionChanged: (value) {
          setState(() {
            expanded = value;
          });
        },
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: widget.invoiceType == 'Electricity'
                  ? Colors.yellow
                  : Colors.blue),
          child: Center(
            child: Text(widget.invoiceType == 'Electricity' ? "E" : "W",
                style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w400)),
          ),
        ),
        title: Text('${widget.title}',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: buildBox(context, color: widget.color),
            ),
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
            expanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 20,
          ),
        ),
        children: [
          widget.invoiceType != ''
              ? Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                      vertical: MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                            widget.invoiceType != ''
                                ? 'Billing Date: ${widget.billing_date}'
                                : 'Processing, Done on ${widget.billing_date}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: lightGreenColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                            widget.invoiceType != ''
                                ? 'Due Date: ${widget.due_date}'
                                : 'Processing, Done on ${widget.due_date}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: lightGreenColor)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ],
                      ),
                    ],
                  ))
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget buildBox(BuildContext context, {Color? color}) {
    return widget.invoiceType != ''
        ? Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.01,
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
