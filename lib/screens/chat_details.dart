import 'dart:ui';
import 'package:agro_assist/splash_screen.dart';
import 'package:agro_assist/screens/log_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatsDetails extends StatefulWidget {
  const ChatsDetails(
      {Key? key,
      required this.friendUid,
      required this.friendNickName,
      this.friendStatus,
      this.friendImage})
      : super(key: key);
  final friendUid;
  final friendNickName;
  final friendStatus;
  final friendImage;

  @override
  _ChatsDetailsState createState() =>
      _ChatsDetailsState(friendUid, friendNickName);
}

class _ChatsDetailsState extends State<ChatsDetails> {
  CollectionReference chats = FirebaseFirestore.instance.collection('chats');
  final friendUid;
  final friendNickName;
  final currentUserId = FirebaseAuth.instance.currentUser!.uid;
  dynamic chatDocId;
  Icon icon1 =
      Icon(CupertinoIcons.clock_solid, color: Colors.grey[400], size: 12);
  Icon icon2 =
      const Icon(CupertinoIcons.checkmark_alt, color: Colors.blue, size: 12);

  void sendMessage(String msg) {
    if (msg == '') {
      displayToast(
          context, 'please type a message', Colors.black, Colors.white);
    } else {
      chats.doc(chatDocId).collection('messages').add({
        'createdOn': FieldValue.serverTimestamp(),
        // 'createdOn': DateTime.now().millisecond.toString(),
        'uid': currentUserId,
        'friendName': friendNickName,
        'msg': msg
      }).then((value) {
        setState(() {
          icon1 = icon2;
        });
      }).catchError((e) {
        displayToast(context, e.message, Colors.black, Colors.white);
      });
      _textEditingController.clear();
    }
  }

  bool isSender(String friend) {
    return friend == currentUserId;
  }

  Alignment getAlignment(String friend) {
    if (friend == currentUserId) {
      return Alignment.topRight;
    }
    return Alignment.topLeft;
  }

  final TextEditingController _textEditingController = TextEditingController();
  _ChatsDetailsState(this.friendUid, this.friendNickName);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkForUsersChats();
  }

  checkForUsersChats() {
    chats
        .where('users', isEqualTo: {friendUid: null, currentUserId: null})
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
          if (querySnapshot.docs.isNotEmpty) {
            setState(() {
              chatDocId = querySnapshot.docs.single.id;
            });
          } else {
            chats.add({
              'users': {currentUserId: null, friendUid: null},
              'names': {
                currentUserId: FirebaseAuth.instance.currentUser?.displayName,
                friendUid: friendNickName
              },
            }).then((value) => {
                  setState(() {
                    chatDocId = value;
                  })
                });
          }
        })
        .catchError((error) {
          displayToast(context, error.code, Colors.black45, Colors.white);
        });
  }

  @override
  Widget build(BuildContext context) {
    // checkForUsersChats();

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("chats")
          .doc(chatDocId)
          .collection('messages')
          .orderBy('createdOn', descending: true)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          displayToast(context, 'please check your network connection',
              Colors.black26, Colors.white);
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          double width = 150;
          double height = 50;
          var radius2 = const Radius.circular(60);
          Color? conColour = Colors.grey[350];
          return shimmerEffect(
              height: height,
              width: width,
              conColour: conColour,
              radius2: radius2);
        }
        if (!snapshot.hasData) {
          displayToast(context, 'please reload your internet properly',
              Colors.black, Colors.white);
        }
        if (snapshot.hasData) {
          // var data;
          var radius = const Radius.circular(13);
          var radius3 = const Radius.circular(40);

          return Scaffold(
            appBar: AppBar(
              centerTitle: false,
              backgroundColor: Colors.green[200],
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.arrow_left,
                  )),
              title: Column(
                children: [
                  Text(
                    friendNickName,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    widget.friendStatus,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    CupertinoIcons.phone,
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    image: const DecorationImage(
                        filterQuality: FilterQuality.high,
                        image: AssetImage('assets/icon.png'))),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView(
                        shrinkWrap: true,
                        reverse: true,
                        children: snapshot.data.docs
                            .map<Widget>((DocumentSnapshot document) {
// data = document.data()!;
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return Align(
                              alignment: getAlignment(data['uid'].toString()),
                              child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                      maxWidth:
                                          MediaQuery.of(context).size.width -
                                              45),
                                  child:
                                      // isSender(data['uid']) ?
                                      Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 1.0),
                                    child: Card(
                                      elevation: 5,
                                      color: isSender(data['uid'])
                                          ? const Color(0xffdcf8c6)
                                          : Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: isSender(data['uid'])
                                              ? BorderRadius.only(
                                                  bottomLeft: radius,
                                                  bottomRight: radius,
                                                  topLeft: radius)
                                              : BorderRadius.only(
                                                  bottomLeft: radius,
                                                  bottomRight: radius,
                                                  topRight: radius)),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 5),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0,
                                                right: 60,
                                                top: 9,
                                                bottom: 20),
                                            child: Text(
                                              data["msg"].toString(),
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 4,
                                            right: 10,
                                            child: Row(
                                              children: [
                                                Text(
                                                  '20:58',
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.grey[600],
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                isSender(data['uid'].toString())
                                                    ? const Icon(Icons.done_all,
                                                        size: 20)
                                                    : Container()
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                  // : Row(children: [
                                  //     CircleAvatar(
                                  //       child: widget.friendImage,
                                  //       radius: 10,
                                  //     ),
                                  //     Padding(
                                  //       padding: const EdgeInsets.symmetric(
                                  //           vertical: 1.0),
                                  //       child: Card(
                                  //         elevation: 5,
                                  //         color: isSender(data['uid'])
                                  //             ? const Color(0xffdcf8c6)
                                  //             : Colors.white,
                                  //         shape: RoundedRectangleBorder(
                                  //             borderRadius:
                                  //                 isSender(data['uid'])
                                  //                     ? BorderRadius.only(
                                  //                         bottomLeft: radius,
                                  //                         bottomRight: radius,
                                  //                         topLeft: radius)
                                  //                     : BorderRadius.only(
                                  //                         bottomLeft: radius,
                                  //                         bottomRight: radius,
                                  //                         topRight: radius)),
                                  //         margin: const EdgeInsets.symmetric(
                                  //             horizontal: 15, vertical: 5),
                                  //         child: Stack(
                                  //           children: [
                                  //             Padding(
                                  //               padding:
                                  //                   const EdgeInsets.only(
                                  //                       left: 10.0,
                                  //                       right: 60,
                                  //                       top: 9,
                                  //                       bottom: 20),
                                  //               child: Text(
                                  //                 data["msg"].toString(),
                                  //                 style: const TextStyle(
                                  //                     fontSize: 16),
                                  //               ),
                                  //             ),
                                  //             Positioned(
                                  //               bottom: 4,
                                  //               right: 10,
                                  //               child: Row(
                                  //                 children: [
                                  //                   Text(
                                  //                     '20:58',
                                  //                     style: TextStyle(
                                  //                       fontSize: 13,
                                  //                       color:
                                  //                           Colors.grey[600],
                                  //                     ),
                                  //                   ),
                                  //                   const SizedBox(width: 5),
                                  //                   isSender(data['uid']
                                  //                           .toString())
                                  //                       ? const Icon(
                                  //                           Icons.done_all,
                                  //                           size: 20)
                                  //                       : Container()
                                  //                 ],
                                  //               ),
                                  //             )
                                  //           ],
                                  //         ),
                                  //       ),
                                  //     )
                                  //   ]),
                                  ));
//                       return Align(
//                         alignment: getAlignment(data["uid"].toString()),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 10, vertical: 10),
//                           child: Material(
//                             elevation: 10,
//                             borderRadius: isSender(data['uid'])
//                                 ? BorderRadius.only(
//                                     topLeft: radius,
//                                     bottomLeft: radius,
//                                     bottomRight: radius)
//                                 : BorderRadius.only(
//                                     topRight: radius,
//                                     bottomLeft: radius,
//                                     bottomRight: radius),
//                             color: isSender(data['uid'])
//                                 ? Colors.green
//                                 : Colors.grey[300],
//                             child: Container(
// // color: Colors.pink,
// // height: 200,
//                               width: MediaQuery.of(context).size.width * 0.65,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         top: 8.0,
//                                         left: 8.0,
//                                         bottom: 8.0,
//                                         right: 80),
//                                     child: Text(data['msg'],
//                                         style: TextStyle(
//                                           color: isSender(data['uid'])
//                                               ? Colors.white
//                                               : Colors.black,
//                                         )),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
                        }).toList(),
                      )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, bottom: 10),
                            child: TextField(
                              controller: _textEditingController,
                              decoration: const InputDecoration(
// enabled: false,
                                  hintText: 'Type Message',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(40)))),
                            ),
                          )),
                          IconButton(
                              onPressed: () => sendMessage(
                                  _textEditingController.text.trim()),
                              icon: const Icon(Icons.send_sharp))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class shimmerEffect extends StatelessWidget {
  const shimmerEffect({
    Key? key,
    required this.height,
    required this.width,
    required this.conColour,
    required this.radius2,
  }) : super(key: key);

  final double height;
  final double width;
  final Color? conColour;
  final Radius radius2;

  /// color: Colors.grey[200],
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            const leftShimmerCon(width: 150, height: 50),
            rightShimmerCOn(
                height: height,
                width: width,
                conColour: conColour,
                radius2: radius2),
            leftShimmerCon(width: width, height: height),
            rightShimmerCOn(
                height: height,
                width: width,
                conColour: conColour,
                radius2: radius2),
            leftShimmerCon(width: width, height: height),
            rightShimmerCOn(
                height: height,
                width: width,
                conColour: conColour,
                radius2: radius2),
            leftShimmerCon(width: width, height: height),
            rightShimmerCOn(
                height: height,
                width: width,
                conColour: conColour,
                radius2: radius2),
            leftShimmerCon(width: width, height: height),
            rightShimmerCOn(
                height: height,
                width: width,
                conColour: conColour,
                radius2: radius2),
          ],
        ),
      ],
    );
  }
}

class rightShimmerCOn extends StatelessWidget {
  const rightShimmerCOn({
    Key? key,
    required this.height,
    required this.width,
    required this.conColour,
    required this.radius2,
  }) : super(key: key);

  final double height;
  final double width;
  final Color? conColour;
  final Radius radius2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 195),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: conColour,
          borderRadius: BorderRadius.only(
              bottomRight: radius2, bottomLeft: radius2, topLeft: radius2),
        ),
      ),
    );
  }
}

class leftShimmerCon extends StatelessWidget {
  const leftShimmerCon({
    required this.width,
    required this.height,
  });
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    var radius2 = const Radius.circular(60);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.only(
              bottomRight: radius2, bottomLeft: radius2, topRight: radius2),
        ),
        width: width,
        height: height,
      ),
    );
  }
}
