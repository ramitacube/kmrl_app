import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';

class SubHeaderTitle extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget image;
  const SubHeaderTitle(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.08,
            right: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.width * 0.05),
        child: Row(children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
            child: image,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    '$title',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontSize: 20,
                        color: darkBlueColor,
                        fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 5, top: 5),
                  child: Text(
                    '$subTitle',
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        color: lightGreenColor,
                        fontWeight: FontWeight.w400),
                  )),
            ],
          ),
        ]));
  }
}
