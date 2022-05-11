import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profileimage extends StatefulWidget {
  // final String img;

  const Profileimage({Key? key}) : super(key: key);

  @override
  _ProfileimageState createState() => _ProfileimageState();
}

class _ProfileimageState extends State<Profileimage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(child: Text('Quize App')),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Qeustions text will apeaer here',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Container(
              child: const Center(
                child: Text(
                  'YES',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              width: 150,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
              child: const Center(
                child: Text(
                  'NO',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              width: 150,
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              )),
          Row(
            children: [
              Icon(
                Icons.clear,
                color: Colors.red,
              )
            ],
          )
        ],
      ),
    );
  }
}
