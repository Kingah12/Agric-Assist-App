import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          ListTile(
            title: Text('chat1'),
          ),
          ListTile(
            title: Text('chat2'),
          ),
          ListTile(
            title: Text('chat3'),
          ),
          ListTile(
            title: Text('chat5'),
          ),
        ],
      ),
    );
  }
}
