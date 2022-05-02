import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';

class EnabledButton extends StatelessWidget {
  final onPressed;
  final String text;
  final Color color;
  final double? size;
  EnabledButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color = kPrimaryColor,
    this.size = 22,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      width: MediaQuery.of(context).size.width * 0.85,
      height: MediaQuery.of(context).size.height * 0.11,
      child: ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0.5),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
            backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor)),
        onPressed: onPressed,
        child: Text(
          '$text',
          style: TextStyle(
              color: Colors.white, fontSize: size, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
