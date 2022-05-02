import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';

class DrawerTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final onTapped;
  const DrawerTile(
      {Key? key,
      required this.title,
      required this.leading,
      required this.onTapped})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width * 0.02),
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.width * 0.01),
      // decoration: BoxDecoration(
      //   border:
      //       Border(bottom: BorderSide(width: 1.0, color: Color(0xffDBDBDB))),
      // ),
      child: InkWell(
        onTap: onTapped,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 30,
            width: 30,
            child: leading,
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 15, bottom: 5, top: 5),
                    child: Text(
                      '$title',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontSize: 16,
                          color: darkBlueColor,
                          fontWeight: FontWeight.normal),
                    )),
              ],
            ),
          ),
          Spacer(),
          Container(
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 28,
              color: lightBlueColor,
            ),
          ),
        ]),
      ),
    );
  }
}
