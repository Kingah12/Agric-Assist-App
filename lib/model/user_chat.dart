import 'package:agro_assist/model/firestore_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserChat {
  String id;
  String photoUrl;
  String nickname;
  String aboutMe;
  String phoneNumber;

  UserChat({
    required this.id,
    required this.photoUrl,
    required this.nickname,
    required this.aboutMe,
    required this.phoneNumber,
  });
  Map<String, String> toJson() {
    return {
      FirestoreConstants.nickname: nickname,
      FirestoreConstants.nickname: aboutMe,
      FirestoreConstants.nickname: photoUrl,
      FirestoreConstants.nickname: phoneNumber,
    };
  }

  factory UserChat.fromDocument(DocumentSnapshot doc) {
    String aboutMe = "";
    String photoUrl = "";
    String nickname = "";
    String phoneNumber = "";
    try {
      aboutMe = doc.get(FirestoreConstants.aboutme);
    } catch (e) {}
    ;
    try {
      aboutMe = doc.get(FirestoreConstants.photoUrl);
    } catch (e) {}
    ;
    try {
      aboutMe = doc.get(FirestoreConstants.nickname);
    } catch (e) {}
    ;
    try {
      aboutMe = doc.get(FirestoreConstants.phoneNumber);
    } catch (e) {}
    ;
    return UserChat(
        id: doc.id,
        photoUrl: photoUrl,
        nickname: nickname,
        aboutMe: aboutMe,
        phoneNumber: phoneNumber);
  }
}
