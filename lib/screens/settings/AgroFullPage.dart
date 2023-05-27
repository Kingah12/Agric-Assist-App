import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AgroFullPage extends StatefulWidget {
  final String image;
  final String fullname;
  final String phoneNumber;
  final String email;
  final String desc;
  const AgroFullPage(
      {Key? key,
      required this.image,
      required this.fullname,
      required this.desc,
      required this.email,
      required this.phoneNumber})
      : super(key: key);

  @override
  State<AgroFullPage> createState() => _AgroFullPageState();
}

class _AgroFullPageState extends State<AgroFullPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///app bar
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
            size: 20,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 35, height: 50, child: Image.asset('assets/icon.png')),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'Agro',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 15),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'Products/Services',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w800,
                  fontSize: 15),
            ),
          ],
        ),
        actions: [
          Container(
            width: 30,
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            width: double.maxFinite,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(widget.image))),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Contact me',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                const SizedBox(height: 10),
                nameCont(title: 'Full Name', text: widget.fullname),
                nameCont(title: 'PhoneNumber', text: widget.phoneNumber),
                nameCont(title: 'Email', text: widget.email),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15),
                      ),
                      IntrinsicHeight(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          padding: const EdgeInsets.all(12),
                          // height: 50,
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: Colors.black, width: 0.5)),
                          child: Text(
                            widget.desc,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  nameCont({title, text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
          IntrinsicWidth(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(12),
              height: 50,
              // width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black, width: 0.5)),
              child: Text(
                text,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
