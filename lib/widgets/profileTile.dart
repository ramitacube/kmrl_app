import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final String leading;
  final onTapped;
  const ProfileTile(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.leading,
      required this.onTapped})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.width * 0.05),
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.08,
          right: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(width: 1.0, color: Color(0xffDBDBDB))),
      ),
      child: InkWell(
        onTap: onTapped,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 30,
            width: 30,
            child: Image.asset('$leading'),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 5, bottom: 5, top: 5),
                    child: Text(
                      '$title',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: 16,
                            color: darkBlueColor,
                          ),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 5, top: 5),
                    width: 250,
                    child: Text(
                      '$subTitle',
                      overflow: TextOverflow.visible,
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: 12,
                            color: Color(0xff999999),
                          ),
                    )),
              ],
            ),
          ),
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
