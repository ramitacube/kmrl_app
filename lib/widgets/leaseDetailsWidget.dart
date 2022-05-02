import 'package:flutter/material.dart';

class LeaseDetailsWidget extends StatelessWidget {
  const LeaseDetailsWidget(
      {Key? key, required this.subTitle, required this.title})
      : super(key: key);
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text('$title', style: Theme.of(context).textTheme.headline4),
          Text(
            '$subTitle',
            style:
                Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 12),
          ),
          Text('\n\nCompany : Pathkraft Solutions'),
          Text('Property : LHS ALVA STRT 60(E1) \n'),
          Text('Lease Date : 19-11-2021'),
          Text('Lease Status : Active'),
          Text('Start Date : 19-11-2021'),
          Text('End Date : 30-11-2022\n'),
          Text('Frequency : Monthly'),
          Text('Days to invoice in advance: 365 days'),
          Text('Notice Period: 45 days'),
          Text('Fit out Period: 0 days\n'),
          Text('Security Deposit Currency : INR'),
          Text('Security deposit : ₹ 6,07,800.00'),
          Text('Security Status : Received\n'),
          Text('Late payment interest percentage :  0.0%'),
          Text("WTax paid by:  By Lessee (Pathkraft Solutions")
        ],
      ),
    );
  }
}
