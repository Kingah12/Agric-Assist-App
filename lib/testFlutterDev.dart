import 'package:flutter/material.dart';

class Dev extends StatefulWidget {
  const Dev({Key? key}) : super(key: key);
  @override
  State<Dev> createState() => _DevState();
}

class _DevState extends State<Dev> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('developer'),
        ),
      ),
    );
  }
}
