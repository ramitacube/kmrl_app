import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';

class AmenitiesSel extends StatelessWidget {
  const AmenitiesSel(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.image,
      required this.bgcolor})
      : super(key: key);
  final String title;
  final VoidCallback onTap;
  final String image;
  final Color bgcolor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  decoration: BoxDecoration(
                    color: bgcolor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(
                    image,
                    color: Colors.white,
                  ),
                ),
                Text(title)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Amenities2 extends StatelessWidget {
  const Amenities2({
    Key? key,
    required this.title,
    required this.onTap,
    required this.image,
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(50),
                    color: lightGreenColor,
                    dashPattern: [6, 4],
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Image.asset(
                        image,
                      ),
                    ),
                  ),
                ),
                Text(title)
              ],
            )
          ],
        ),
      ),
    );
  }
}
