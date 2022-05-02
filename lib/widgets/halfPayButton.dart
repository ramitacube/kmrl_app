import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';

class HalfPay extends StatelessWidget {
  final onPressed;
  final String text;
  final Color color;

  HalfPay({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color = lightGreenColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 10),
      width: 100,
      height: 30,
      child: ElevatedButton(
        style: ButtonStyle(
            // padding: ,
            elevation: MaterialStateProperty.all<double>(0.5),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
            backgroundColor: MaterialStateProperty.all<Color>(color)),
        onPressed: onPressed,
        child: Text(
          '$text',
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
