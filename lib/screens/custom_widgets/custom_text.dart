import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final double? textSize;
  final Color? textColor;
  final FontWeight? weight;

  const CustomTextWidget(
      {Key? key,
      required this.text,
      this.textSize,
      this.textColor,
      this.weight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(this.text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: this.textColor,
            fontSize: this.textSize,
            fontWeight: weight ?? FontWeight.bold));
  }
}
