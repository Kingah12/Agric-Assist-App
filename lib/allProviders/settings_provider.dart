import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/log_in.dart';

// DateTime backPressedTime = DateTime.now();
Future<bool> onBackButtonPressed(context, backPressedTime) async {
  ///difference in time
  final difference = DateTime.now().difference(backPressedTime);
  backPressedTime = DateTime.now();
  if (difference >= const Duration(seconds: 2)) {
    displayToast(
        context, 'Click again to close the app', Colors.red, Colors.white);
    return false;
  } else {
    SystemNavigator.pop(animated: true);
    return true;
  }
}

class SettingsProvider {
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  SettingsProvider({
    required this.prefs,
    required this.firebaseFirestore,
    required this.firebaseStorage,
  });
  String? getPref(String key) {
    return prefs.getString(key);
  }

  Future<bool> setPref(String key, String value) async {
    return await prefs.setString(key, value);
  }

  UploadTask uploadFile(File image, String fileName) {
    Reference reference = firebaseStorage.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(image);
    return uploadTask;
  }

  Future<void> updateDataFirestore(
      String collectionPath, String path, Map<String, String> dataNeedUpdate) {
    return firebaseFirestore
        .collection(collectionPath)
        .doc(path)
        .update(dataNeedUpdate);
  }
}
