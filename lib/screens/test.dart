import 'package:flutter/material.dart';

class MyRichApp extends StatefulWidget {
  const MyRichApp({Key? key}) : super(key: key);

  @override
  State<MyRichApp> createState() => _MyRichAppState();
}

class _MyRichAppState extends State<MyRichApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text('My Rich App', style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset('assets/icon.png'),
        ));
  }
}
