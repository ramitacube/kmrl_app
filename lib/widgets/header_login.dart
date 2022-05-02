import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';

class HeaderLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(left: 25, top: 5),
            child: KmrlIcons.logoSmall(),
          ),
          Container(
            margin: EdgeInsets.only(left: 25),
            child: RichText(
              text: TextSpan(
                  text: 'Connect to ',
                  style: Theme.of(context).textTheme.headline1,
                  children: [
                    TextSpan(
                      text: 'Business',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ]),
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 25),
              child: Text('One App for Enterprise Property Management')),
        ],
      ),
    );
  }
}
