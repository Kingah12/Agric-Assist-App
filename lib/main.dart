import 'package:agro_assist/allProviders/settings_provider.dart';
import 'package:agro_assist/splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/local_notifications.dart';

///receive message when app is in background solution for onn message
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    // MyApp(
    //   pres: prefs,
    // ),
    EasyLocalization(
      saveLocale: true,
      fallbackLocale: const Locale('en'),
      // assetLoader: CodegenLoader(),
      supportedLocales: const [
        Locale("en"),
        Locale("ig"),
      ],
      path: 'assets/languages',
      child: MyApp(
        pres: prefs,
      ),
    ),
  );
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
        // localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        //   DefaultWidgetsLocalizations.delegate,
        //   DefaultMaterialLocalizations.delegate,
        // ],

        localizationsDelegates: context.localizationDelegates,

        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(brightness: Brightness.light),
        debugShowCheckedModeBanner: false,
        title: 'Agro assist',
        home:
            // ChatPageScreen(),
            const MySplashScreen(),
        // MyRichApp(),
        // const Registration(),
        // Introduction()
      ),
    );
  }
}
