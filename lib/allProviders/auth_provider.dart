import 'package:agro_assist/model/firestore_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final SharedPreferences prefs;

  AuthProvider({
    required this.prefs,
  });
  String? getUserFirebaseId() {
    return prefs.getString(FirestoreConstants.id);
  }
}
