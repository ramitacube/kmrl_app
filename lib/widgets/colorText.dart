import 'package:flutter/material.dart';

Widget styleRichText(
    String name1, String name2, TextStyle style1, TextStyle style2) {
  return RichText(
    text: TextSpan(
        text: '$name1',
        style: style1,
        children: [TextSpan(text: '$name2', style: style2)]),
  );
}
