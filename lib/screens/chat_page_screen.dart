// import 'dart:ffi';
//
// import 'package:agro_assist/screens/chat_screen.dart';
// import 'package:agro_assist/screens/log_in.dart';
// import 'package:agro_assist/splash_screen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class ChatPageScreen extends StatefulWidget {
//   const ChatPageScreen({Key? key}) : super(key: key);
//
//   @override
//   _ChatPageScreenState createState() => _ChatPageScreenState();
// }
//
// class _ChatPageScreenState extends State<ChatPageScreen>
//     with WidgetsBindingObserver {
//   bool _isLoading = false;
//   final TextEditingController _search = TextEditingController();
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   Map<String, dynamic>? userMap;
//
//   String chatRoomId(String user1, String user2) {
//     if (user1[0].toLowerCase().codeUnits[0] >
//         user2.toLowerCase().codeUnits[0]) {
//       return "$user1$user2";
//     } else {
//       return "$user2$user1";
//     }
//   }
//
//   void search() async {
//     FirebaseFirestore _firestore = FirebaseFirestore.instance;
//     if (_search.text.isEmpty) {
//       displayToast(context, 'please search again', Colors.black, Colors.white);
//     } else {
//       setState(() {
//         _isLoading = true;
//       });
//       await _firestore
//           .collection("users")
//           .where('nickname', isEqualTo: _search.text)
//           .get()
//           .then((value) {
//         setState(() {
//           userMap = value.docs[0].data();
//           _isLoading = false;
//         });
//       }).catchError((e) {
//         setState(() {
//           _isLoading = false;
//         });
//         displayToast(context, e.message, Colors.black, Colors.white);
//       });
//     }
//   }
//
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   WidgetsBinding.instance!.addObserver(this);
//   //   setStatus('online');
//   // }
//   //
//   // void setStatus(String status) async {
//   //   await _firestore.collection('users').doc(auth.currentUser!.uid).update({
//   //     "status": status,
//   //   });
//   // }
//
//   // @override
//   // void didChangeAppLifecycleState(AppLifecycleState state) {
//   //   if (state == AppLifecycleState.resumed) {
//   //     //onlines
//   //     setStatus('online');
//   //   } else {
//   //     //offline}
//   //     setStatus("offline");
//   //   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back_ios_outlined,
//             color: Colors.black,
//           ),
//           iconSize: 24,
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: Colors.white,
//         title: Row(
//           children: [
//             SizedBox(
//                 width: 50, height: 50, child: Image.asset('assets/icon.png')),
//             const SizedBox(width: 10),
//             const Text(
//               'Agro Chat',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 23),
//             ),
//           ],
//         ),
//       ),
//       body: _isLoading
//           ? const Center(
//               child: CircularProgressIndicator(
//                 color: Colors.green,
//               ),
//             )
//           : Container(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 30),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                     child: TextField(
//                       controller: _search,
//                       decoration: InputDecoration(
//                           hintText: 'Search...',
//                           // contentPadding: EdgeInsets.symmetric(vertical: 10),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           )),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 100.0),
//                     child: ElevatedButton(
//                         onPressed: search,
//                         child: Center(
//                           child: Row(
//                             children: const [
//                               Text('search'),
//                               Icon(Icons.search),
//                             ],
//                           ),
//                         )),
//                   ),
//                   if (userMap != null)
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 10.0, vertical: 20),
//                       child: ListTile(
//                         onTap: () {
//                           String roomId = chatRoomId(
//                               auth.currentUser!.email.toString(),
//                               userMap!['nickname']);
//                           // Navigator.push(
//                           //     context,
//                           //     MaterialPageRoute(
//                           //         builder: (context) => ChatPage(
//                           //               userMap: userMap,
//                           //               chatRoomId: roomId,
//                           //               // title: userMap![''],
//                           //             )));
//                         },
//                         /* leading: CircleAvatar(
//                               backgroundImage:
//                                   NetworkImage(userMap?["photoUrl"]),
//                             ),*/
//                         leading: const Icon(Icons.account_box_outlined),
//                         title: Text(
//                           userMap!["nickname"],
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 16),
//                         ),
//                         subtitle: Text(userMap!["email"]),
//                         trailing: const Icon(Icons.message_outlined),
//                       ),
//                     )
//                   else
//                     Container(),
//                 ],
//               ),
//             ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import 'chat_page_tab_screens/calls.dart';
import 'chat_page_tab_screens/chats.dart';
import 'chat_page_tab_screens/people.dart';

class ChatPageScreen extends StatefulWidget {
  final String userName;
  const ChatPageScreen({Key? key, required this.userName}) : super(key: key);

  @override
  _ChatPageScreenState createState() => _ChatPageScreenState();
}

class _ChatPageScreenState extends State<ChatPageScreen> {
  int currentIndex = 0;
  var screens = <Widget>[
    const Chats(),
    Calls(),
    People(),

    // const ChatSettings(),
  ];

  String currentUserUid = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onUserLogin();
  }

  void onUserLogin() {
    /// 2.1. initialized ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged in or re-logged in
    /// We recommend calling this method as soon as the user logs in to your app.
    ZegoUIKitPrebuiltCallInvitationService().init(
        notifyWhenAppRunningInBackgroundOrQuit: true,
        // appID: 712545703,
        appID: 1014199522,
        appSign:
            "379c89c11ea67772f36569337f0854e975028daed1f12073c6bb42eb5b4a1fc8",
//4696660010779629
        //251
        // or
        //257
        // appSign:
        //     "c3c2e49f6352bccd98cb45d7460fcba7ccc50f57a336ed0a7ef70eac8177f023",
        userID: currentUserUid,
        userName: widget.userName,
        // child: widget.child,
        plugins: [ZegoUIKitSignalingPlugin()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int value) {
            setState(() {
              currentIndex = value;
            });
          },
          unselectedIconTheme:
              const IconThemeData(size: 15, color: Colors.grey),
          selectedIconTheme: const IconThemeData(size: 20, color: Colors.green),
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(
              color: Colors.grey, fontSize: 10, fontWeight: FontWeight.w400),
          selectedLabelStyle: const TextStyle(
              color: Colors.green, fontSize: 15, fontWeight: FontWeight.w700),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_2_fill), label: 'Chats'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.phone), label: 'Call'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_alt_circle_fill),
                label: ' Person'),
            // BottomNavigationBarItem(
            //     icon: Icon(CupertinoIcons.settings_solid), label: 'Settings'),
          ]),
    );
  }
}
