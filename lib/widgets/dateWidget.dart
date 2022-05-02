import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';

class DateWidget extends StatelessWidget {
  const DateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.08,
            right: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.width * 0.05),
        child: Row(
          children: [
            KmrlIcons.calender(),
            Container(
              margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date of Entry',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: darkBlueColor, fontSize: 14)),
                  Text('2nd Nov 2021, 3:30pm')
                ],
              ),
            )
          ],
        ));
  }
}
