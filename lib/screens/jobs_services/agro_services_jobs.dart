import 'package:agro_assist/screens/jobs_services/upload_products.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../log_in.dart';
import '../settings/AgroFullPage.dart';

class AgroService_Jobs extends StatefulWidget {
  AgroService_Jobs({Key? key}) : super(key: key);

  @override
  State<AgroService_Jobs> createState() => _AgroService_JobsState();
}

class _AgroService_JobsState extends State<AgroService_Jobs> {
  final CollectionReference usersPostsForJobs =
      FirebaseFirestore.instance.collection('usersPostsForJobs');

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

      ///floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const UploadProducts_Services()));
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add_a_photo_outlined, color: Colors.white),
      ),

      ///body
      body: StreamBuilder<QuerySnapshot>(
          stream: usersPostsForJobs
              // .where('isFollowing', isEqualTo: true)
              .orderBy("timeStamp", descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 15),
                  Text(
                    'Loading...',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  )
                ],
              ));
            }
            try {
              if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.image, color: Colors.grey, size: 60),
                      SizedBox(height: 20),
                      Text(
                        'No job post available! please make a post.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }
            } catch (e) {
              displayToast(context, "please check your internet", Colors.red,
                  Colors.white);
            }
            try {
              if (snapshot.hasData) {
                var data = snapshot.data!.docs;
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return conTimeLine(
                        fullname: data[index]['fullName'],
                        phoneNo: data[index]['phoneNumber'],
                        email: data[index]['email'],
                        image: data[index]['postImage'],
                        desc: data[index]['message'],
                      );
                    });
              }
            } catch (e) {}
            return Container();
          }),
    );
  }

  Widget conTimeLine({fullname, phoneNo, email, image, desc}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AgroFullPage(
                      image: image,
                      fullname: fullname,
                      phoneNumber: phoneNo,
                      email: email,
                      desc: desc,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        width: double.infinity,
        height: 300,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              image == null
                  ? Container()
                  : Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        height: 200,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          color: Colors.transparent,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                        ),
                      )),
              IntrinsicHeight(
                child: Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.black54,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        detailsText(text: 'Full Name: $fullname'),
                        detailsText(text: 'Phone Number: $phoneNo'),
                        detailsText(text: 'Email Address: $email'),
                        detailsText(text: 'Description: $desc'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailsText({text}) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, left: 1),
      child: Text(
        text,
        style: const TextStyle(
            overflow: TextOverflow.ellipsis,
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14),
      ),
    );
  }
}
