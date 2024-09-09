import 'package:flutter/material.dart';

import '../constants.dart';

class OrderByComponent extends StatelessWidget {
  OrderByComponent({
    super.key,
    required this.text1,
    required this.text2,
  });
  String text1;
  String text2;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 758;
    double width = MediaQuery.of(context).size.width / 360;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text1 + " ",
          style: TextStyle(
            fontSize: width * 15,
          ),
        ),
        Text(
          '/ $text2',
          style: TextStyle(
            fontSize: width * 15,
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
