import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../screens/chat_page_tab_screens/chatScreens/chatDetailScreen_Page.dart';

Models model = Models();

class Models {
  String currentUserUid = FirebaseAuth.instance.currentUser!.uid;
  CollectionReference usersRef = FirebaseFirestore.instance.collection('users');
  callChatScreen_Page(context, String uid, String nickName) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ChatDetailScreen_Page(friendUid: uid, friendName: nickName);
    }));
  }
}
