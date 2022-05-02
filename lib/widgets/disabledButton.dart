import 'package:flutter/material.dart';

class DisabledButton extends StatelessWidget {
  final String text;
  final double? size;
  final VoidCallback? onPressed;
  DisabledButton({Key? key, required this.text, this.size = 22, this.onPressed})
      : super(key: key);
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
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.grey.shade300)),
        onPressed: onPressed,
        child: Text(
          '$text',
          style: TextStyle(color: Colors.white, fontSize: size),
        ),
      ),
    );
  }
}
