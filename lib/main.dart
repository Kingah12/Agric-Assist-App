import 'package:agro_assist/allProviders/settings_provider.dart';
import 'package:agro_assist/splash_screen.dart';
import 'package:agro_assist/testPage/profileImage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    pres: prefs,
  ));
}

final CollectionReference users =
    FirebaseFirestore.instance.collection('users');

class MyApp extends StatelessWidget {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final SharedPreferences pres;
  MyApp({required this.pres});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SettingsProvider>(
            create: (_) => SettingsProvider(
                prefs: this.pres,
                firebaseFirestore: this.firebaseFirestore,
                firebaseStorage: this.firebaseStorage))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aggro assist',
        home: MySplashScreen(),
      ),
    );
  }
}