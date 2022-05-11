import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'log_in.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SpinKitWanderingCubes(
            color: Colors.white,
            size: 50,
          ),
          const SizedBox(
            height: 50,
          ),
          AnimatedTextKit(
            totalRepeatCount: 10,
            animatedTexts: [
              ScaleAnimatedText(
                'Loading...',
                textStyle: kAnimStyle,
              ),
              ScaleAnimatedText('Please', textStyle: kAnimStyle),
              ScaleAnimatedText('wait', textStyle: kAnimStyle),
            ],
          )
        ],
      ),
    );
  }
}
