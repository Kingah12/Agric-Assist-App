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
          title: const Text(
            'My Rich App',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              foregroundColor: Colors.brown,
            )
          ],
        ));
  }
}
