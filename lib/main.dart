import 'package:agro_assist/allProviders/settings_provider.dart';
import 'package:agro_assist/model/local_notification_service.dart';
import 'package:agro_assist/screens/chat_page_screen.dart';
import 'package:agro_assist/splash_screen.dart';
import 'package:agro_assist/testPage/profileImage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

///when app is in background
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
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
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.light),
        debugShowCheckedModeBanner: false,
        title: 'Aggro assist',
        home:
            // ChatPageScreen(),
            MySplashScreen(),
      ),
    );
  }
}
