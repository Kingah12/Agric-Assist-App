import 'package:flutter/material.dart';

class Quize extends StatefulWidget {
  const Quize({Key? key}) : super(key: key);

  @override
  _QuizeState createState() => _QuizeState();
}

class _QuizeState extends State<Quize> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Quiz App'),
      ),
    );
  }
}
