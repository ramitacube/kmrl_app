import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
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
    );
  }
}
