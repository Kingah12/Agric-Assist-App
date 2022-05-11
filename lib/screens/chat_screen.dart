// import 'package:flutter/material.dart';
//
// import 'chat_page_screen.dart';
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//             child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 60.0, left: 30, right: 30),
//               child: TextField(
//                 decoration: InputDecoration(
//                     hintTextDirection: TextDirection.ltr,
//                     filled: true,
//                     hintStyle: const TextStyle(
//                         fontSize: 18,
//                         leadingDistribution:
//                             TextLeadingDistribution.proportional,
//                         color: Colors.grey,
//                         fontWeight: FontWeight.bold),
//                     hintText: 'Search Agro Friends',
//                     fillColor: Colors.grey.shade300,
//                     border: const OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(30)),
//                       borderSide: BorderSide.none,
//                     )),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const chatPages(
//               image: "assets/image.png",
//               title: 'Emmanuel Flutter',
//               subtitle: 'Film Maker - Actor & Director',
//             ),
//             const chatPages(
//               image: "assets/farmer1.jpg",
//               title: 'John Flutter',
//               subtitle: 'Film Maker - Actor & Director',
//             ),
//             const chatPages(
//               image: "assets/Farmer2.png",
//               title: 'Cynthia Flutter',
//               subtitle: 'Film Maker - Actor & Director',
//             ),
//             const chatPages(
//               image: "assets/farmer4.jpg",
//               title: 'Peter Flutter',
//               subtitle: 'Film Maker - Actor & Director',
//             ),
//             const chatPages(
//               image: "assets/news.jpg",
//               title: 'Elon Flutter',
//               subtitle: 'Film Maker - Actor & Director',
//             ),
//           ],
//         )),
//       ),
//     );
//   }
// }
//
// class chatPages extends StatelessWidget {
//   final String image;
//   final String title;
//   final String subtitle;
//
//   const chatPages(
//       {required this.image, required this.title, required this.subtitle});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => ChatPageScreen(
//                       title: title,
//                     )));
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
//         child: Container(
//           child: Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 6.0),
//                 child: CircleAvatar(
//                   radius: 20,
//                   backgroundImage: AssetImage(image),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       title,
//                       style: const TextStyle(
//                           color: Colors.black87,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Text(
//                       subtitle,
//                       style: const TextStyle(
//                         color: Colors.grey,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           height: 60,
//           width: MediaQuery.of(context).size.width,
//           decoration: BoxDecoration(
//               color: Colors.grey.shade200,
//               borderRadius: BorderRadius.circular(12)),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../splash_screen.dart';

class ChatPage extends StatefulWidget {
  // Map<String, dynamic>? userMap;
  // late String chatRoomId;
  // ChatPage({Key? key, required this.userMap, required this.chatRoomId})
  //     : super(key: key);
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _sendMessage = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final logedInUser = FirebaseAuth.instance.currentUser;
  // FirebaseUser loggedInUser;

  // onSendMessage() async {
  //   print(auth.currentUser!.email);
  //   print(logedInUser!.uid);
  //   if (_sendMessage.text.isNotEmpty) {
  //     Map<String, dynamic> messages = {
  //       "sendby": auth.currentUser!.email,
  //       "message": _sendMessage.text,
  //       "time": FieldValue.serverTimestamp(),
  //     };
  //
  //     await _firestore
  //         .collection("chatroom")
  //         .doc(widget.chatRoomId)
  //         .collection("chats")
  //         .add(messages);
  //   } else {
  //     print('');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("name"),
        // title: Text(widget.userMap!['nickname']),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Expanded(
          //   child: Container(
          //     height: size.height / 1.25,
          //     width: size.width,
          //     // color: Colors.green,
          //     child: StreamBuilder<QuerySnapshot>(
          //       stream: _firestore
          //           .collection('chatroom')
          //           .doc(widget.chatRoomId)
          //           .collection('chats')
          //           .orderBy("time", descending: false)
          //           .snapshots(),
          //       builder: (BuildContext context,
          //           AsyncSnapshot<QuerySnapshot> snapshot) {
          //         if (snapshot.data != null) {
          //           return ListView.builder(
          //             physics: const BouncingScrollPhysics(),
          //             itemCount: snapshot.data!.docs.length,
          //             itemBuilder: (context, index) {
          //               Map<String, dynamic> map = snapshot.data!.docs[index]
          //                   .data() as Map<String, dynamic>;
          //               return messages(
          //                 size,
          //                 map,
          //               );
          //             },
          //           );
          //         } else if (snapshot.data == null) {
          //           return const Center(child: CircularProgressIndicator());
          //         } else {
          //           return Container();
          //         }
          //       },
          //     ),
          //   ),
          // ),
          Expanded(
              child: Container(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  final messages = snapshot.data!.docs;
                  List<Text> messageWidgets = [];
                  for (var message in messages) {
                    final messageText = message['text'];
                    final messageSender = message['sender'];
                    final messageWidget =
                        Text("$messageText from $messageSender");
                    messageWidgets.add(messageWidget);
                  }
                  return Column(
                    children: messageWidgets,
                  );
                }
                return Container();
              },
            ),
          )),
          Container(
            // color: Colors.green,
            height: size.height / 12,
            width: size.width / 1.1,
            alignment: Alignment.center,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: size.height / 12,
                  width: size.width / 1.5,
                  child: TextField(
                    controller: _sendMessage,
                    decoration: InputDecoration(
                        hintText: 'send message',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18))),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (_sendMessage.text.isNotEmpty) {
                        _firestore.collection('messages').add({
                          'text': _sendMessage.text,
                          'sender': logedInUser!.email
                        });
                      }
                      _sendMessage.clear();
                    },
                    // onSendMessage,
                    icon: const Icon(Icons.send))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget messages(
    Size size,
    Map<String, dynamic> map,
  ) {
    final logedInUser = FirebaseAuth.instance.currentUser!.email;
    final user = auth.currentUser!.email;
    final bool isMe = logedInUser == user;
    final radius = Radius.circular(20);
    return Container(
      width: size.width,
      alignment:
          map['sendby'] == user ? Alignment.centerRight : Alignment.centerLeft,
      // alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: radius, bottomLeft: radius, topLeft: radius),
            color: map['sendby'] == user ? Colors.blue : Colors.white),
        child: Text(
          map['message'],
          style: TextStyle(
              color: map['sendby'] == user ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
