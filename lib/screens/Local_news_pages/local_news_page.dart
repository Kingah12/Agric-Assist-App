import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocalNewsPage extends StatefulWidget {
  final String image;
  final String subtitle;
  final String title;
  final String source;
  final String body;
  final String date;
  final String time;
  const LocalNewsPage(
      {required this.image,
      required this.subtitle,
      required this.title,
      required this.source,
      required this.body,
      required this.date,
      required this.time,
      Key? key})
      : super(key: key);

  @override
  _LocalNewsPageState createState() => _LocalNewsPageState();
}

class _LocalNewsPageState extends State<LocalNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.back,
                    size: 25,
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, bottom: 8),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  widget.source,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  children: [
                    Text(
                      'Published ${widget.date},',
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.time,
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                    // borderRadius: const BorderRadius.only(
                    //   bottomRight: Radius.circular(20),
                    //   bottomLeft: Radius.circular(20),
                    // ),
                    // color: Colors.pink,
                    image: DecorationImage(
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.contain,
                        image: NetworkImage(widget.image))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 5, right: 5),
                child: Text(
                  widget.subtitle,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.body,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
