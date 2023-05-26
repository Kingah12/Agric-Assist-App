import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/chat_page_tab_screens/chatScreens/chatDetailScreen_Page.dart';

Models model = Models();

class Models extends ChangeNotifier {
  String currentUserUid = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');
  callChatScreen_Page(context, String uid, String nickName, friendImage) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ChatDetailScreen_Page(
          friendUid: uid, friendName: nickName, friendImage: friendImage);
    }));
  }

  ///setUserName
  String userName = '';
  setUserName(String usersName) {
    userName = usersName;
    notifyListeners();
  }

  ///setUserProfilePic
  String userPic = '';
  setUserProfilePic(String usersPic) {
    userPic = usersPic;
    notifyListeners();
  }

  ///set Current USER NAME
  getUserNameFromBackEnd() async {
    try {
      if (currentUser != null) {
        final firestore = FirebaseFirestore.instance;
        final DocumentSnapshot userDoc =
            await firestore.collection('users').doc(currentUser!.uid).get();

        userName = userDoc.get('nickname');
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  getUserProfilePicsFromBackEnd() async {
    try {
      if (currentUser != null) {
        final firestore = FirebaseFirestore.instance;
        final DocumentSnapshot userDoc =
            await firestore.collection('users').doc(currentUser!.uid).get();

        userPic = userDoc.get('photoUrl');
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}

class Unfocus extends StatelessWidget {
  final Widget child;
  const Unfocus({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
