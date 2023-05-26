import 'dart:ui';

import 'package:agro_assist/allProviders/settings_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../allProviders/models.dart';
import '../../log_in.dart';
import 'calls_pages/video_calls.dart';
import 'calls_pages/voice_calls.dart';

class ChatDetailScreen_Page extends StatefulWidget {
  final String friendUid;
  final String friendName;
  final String friendImage;
  const ChatDetailScreen_Page(
      {Key? key,
      required this.friendUid,
      required this.friendName,
      required this.friendImage})
      : super(key: key);

  @override
  State<ChatDetailScreen_Page> createState() => _ChatDetailScreen_PageState();
}

class _ChatDetailScreen_PageState extends State<ChatDetailScreen_Page> {
  CollectionReference chatRefs = FirebaseFirestore.instance.collection('chats');
  final currentUserUid = FirebaseAuth.instance.currentUser!.uid;
  var chatDocId;
  String status = '';
  String? currentUserNickName;
  sendMessage(String msg) {
    if (messageController.text.isEmpty) return null;
    if (chatDocId != null) {
      Map<String, dynamic> data = {
        'createdOn': DateTime.now(),
        'uid': currentUserUid,
        'friendName': widget.friendName,
        'msg': msg,
      };
      chatRefs.doc(chatDocId).update({
        'last_message': messageController.text,
        'last_message_time': DateTime.now(),
      });
      chatRefs.doc(chatDocId).collection('messages').add(data);
      messageController.clear();
    } else {
      Map<String, dynamic> data = {
        'createdOn': DateTime.now(),
        'uid': currentUserUid,
        'friendName': widget.friendName,
        'msg': msg,
      };
      chatRefs.add({
        "users": [widget.friendUid, currentUserUid],
        'last_message': messageController.text,
        'last_message_time': DateTime.now(),
      }).then((value) async {
        value.collection('messages').add(data);
      });
      messageController.clear();
    }
  }

  TextEditingController messageController = TextEditingController();

  ZegoSendCallInvitationButton callActionButtons(bool isVideo) {
    return ZegoSendCallInvitationButton(
      isVideoCall: isVideo,
      resourceID: "zegouikit_call",
      buttonSize: const Size(45, 45),
      iconSize: const Size(40, 40),
      invitees: [
        ZegoUIKitUser(id: widget.friendUid, name: widget.friendName),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///appBar
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.grey[100],
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.lightGreen,
          ),
        ),
        centerTitle: false,

        /// user name and status
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(widget.friendImage),
            ),
            const SizedBox(width: 7),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///nickName
                Text(
                  widget.friendName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.5),
                ),
                const SizedBox(height: 0.5),

                ///status
                StreamBuilder(
                    stream: model.usersRef.doc(widget.friendUid).snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                          snapshot.data['status'] == 'offline'
                              ? 'last seen today at ${DateFormat('hh:mm a').format(snapshot.data["lastSeen"].toDate())}'
                              : snapshot.data['status'],
                          style: TextStyle(
                              color: snapshot.data['status'] == 'offline'
                                  ? Colors.blueGrey
                                  : Colors.green,
                              fontWeight: FontWeight.w400,
                              fontSize: 10),
                        );
                      }
                      return Container();
                    }),
              ],
            ),
          ],
        ),
        actions: [
          ///voice call Icon
          IconButton(
            onPressed: () {
              // callActionButtons(false);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => VoiceCallPage(
                            callID: '2',
                            userName: widget.friendName,
                            userId: widget.friendUid,
                          )));
            },
            icon: const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.call_rounded,
                  color: Colors.white,
                )),
            color: Colors.green,
          ),
          // const SizedBox(width: 2),
          // callActionButtons(
          //   false,
          // ),
          const SizedBox(width: 2),

          ///video call icon

          IconButton(
            onPressed: () {
              // callActionButtons(true);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => videoCallPage(
                            callID: '2',
                            userName: widget.friendName,
                            userId: widget.friendUid,
                          )));
            },
            icon: const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.green,
              child: Icon(
                Icons.video_call_rounded,
                color: Colors.white,
              ),
            ),
            color: Colors.green,
          ),

          ///
          // callActionButtons(
          //   true,nmbchjbxlkcvjbZKJVbKJZLchkjzLXNC
          // ),
          const SizedBox(width: 0.5),
        ],
      ),

      ///Body
      body: StreamBuilder(
        stream: chatRefs.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          List<QueryDocumentSnapshot> allData = snapshot.data == null
              ? []
              : snapshot.data!.docs
                  .where((element) =>
                      element['users'].contains(widget.friendUid) &&
                      element['users'].contains(currentUserUid))
                  .toList();
          QueryDocumentSnapshot<Object?>? data =
              allData.isNotEmpty ? allData.first : null;
          if (data != null) {
            chatDocId = data.id;
          }
          // chatDocId = data!.id;
          if (snapshot.hasData) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  image: const DecorationImage(
                      filterQuality: FilterQuality.high,
                      image: AssetImage('assets/icon.png'))),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Column(
                  children: [
                    // callActionButtons(true),

                    ///message body
                    data == null
                        ? Expanded(
                            child: Container(
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  'you have no messages with this user!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              height: 200,
                            ),
                          )
                        : Expanded(
                            child: StreamBuilder(
                                stream: data.reference
                                    .collection("messages")
                                    .orderBy('createdOn', descending: true)
                                    .snapshots(),
                                builder: (context, AsyncSnapshot snap) {
                                  // if (!snap.hasData) {
                                  //   return const Text(
                                  //       'You have no messages with this user');
                                  // }
                                  if (snap.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                  var realData = snap.data!.docs;
                                  if (snapshot.hasData) {
                                    return ListView.builder(
                                        reverse: true,
                                        itemCount: snap.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          return Align(
                                              alignment: currentUserUid ==
                                                      realData[index]['uid']
                                                  ? Alignment.topRight
                                                  : Alignment.topLeft,
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: currentUserUid ==
                                                            realData[index]
                                                                ['uid']
                                                        ? 15.0
                                                        : 5,
                                                    top: 10,
                                                    right: 5,
                                                    bottom: 5),
                                                child: ConstrainedBox(
                                                  constraints:
                                                      const BoxConstraints(
                                                          maxWidth: 250),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: currentUserUid ==
                                                              realData[index]
                                                                  ['uid']
                                                          ? Color(0xffdcf8c6)
                                                          : Colors.grey[200],
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft: currentUserUid ==
                                                                realData[index]
                                                                    ['uid']
                                                            ? const Radius
                                                                .circular(12)
                                                            : const Radius
                                                                .circular(0),
                                                        topRight: currentUserUid ==
                                                                realData[index]
                                                                    ['uid']
                                                            ? const Radius
                                                                .circular(0)
                                                            : const Radius
                                                                .circular(12),
                                                        bottomLeft: const Radius
                                                            .circular(12),
                                                        bottomRight:
                                                            const Radius
                                                                .circular(12),
                                                      ),
                                                    ),
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 8,
                                                            right: 10,
                                                            top: 8,
                                                            bottom: 8),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        ///msges
                                                        Text(
                                                          realData[index]["msg"]
                                                              .toString(),
                                                          maxLines: 5,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 16),
                                                        ),

                                                        ///time
                                                        Text(
                                                          DateFormat("hh:mm a")
                                                              .format(realData[
                                                                          index]
                                                                      [
                                                                      'createdOn']
                                                                  .toDate()),
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: Colors
                                                                .grey[600],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ));
                                        });
                                  }
                                  return Container();
                                }),
                          ),

                    ///textField for sending messages
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: 10, right: 10, left: 10),
                      alignment: Alignment.bottomCenter,
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          ///

                          ///icon for sending images
                          const Positioned(
                            bottom: 1,
                            child: Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.lightGreen,
                                size: 26,
                              ),
                            ),
                          ),

                          ///textFieldFor sending messages
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 35.0, right: 38, top: 5),
                            child: TextField(
                              minLines: 1,
                              maxLines: 10,
                              style: const TextStyle(color: Colors.black),
                              controller: messageController,
                              decoration: InputDecoration(
                                focusColor: Colors.transparent,
                                hintText: 'Type a message here',
                                fillColor: Colors.grey[50],
                                filled: true,
                                hintStyle: const TextStyle(
                                    fontSize: 15, color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40)),
                              ),
                            ),
                          ),

                          ///send button
                          Positioned(
                            bottom: 1,
                            right: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 0),
                              child: InkWell(
                                onTap: () {
                                  sendMessage(messageController.text);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  child: const Icon(
                                    Icons.send_outlined,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
