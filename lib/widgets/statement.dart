import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';

class Statement extends StatelessWidget {
  const Statement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.03,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildContent(context, 'Current', lightGreenColor, '25,000'),
          buildContent(context, 'Pending', darkRedColor, '38,000'),
          buildContent(context, 'Balance', lightGreenColor, '38,000'),
        ],
      ),
    );
  }

  Widget buildContent(
      BuildContext context, String title, Color color, String amount) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.01,
        right: MediaQuery.of(context).size.width * 0.01,
        top: MediaQuery.of(context).size.width * 0.01,
        bottom: MediaQuery.of(context).size.width * 0.01,
      ),
      decoration: BoxDecoration(color: bgGreyColor),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.02,
                    left: MediaQuery.of(context).size.width * 0.02,
                    bottom: MediaQuery.of(context).size.width * 0.02),
                child: Text(
                  '$title',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Icon(
                Icons.arrow_drop_up,
                color: color,
                size: 36.0,
              )
            ],
          ),
          Container(
            child: Text('           $amount',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    color: darkBlueColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w300)),
          )
        ],
      ),
    );
  }
}
