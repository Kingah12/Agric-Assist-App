import 'package:flutter/material.dart';

class contContinueButtonWithArrow extends StatelessWidget {
  final String text;
  final Function()? onTaped;

  const contContinueButtonWithArrow({
    required this.text,
    required this.onTaped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaped,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.lightGreenAccent,
            borderRadius: BorderRadius.circular(
              30,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$text  '),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
