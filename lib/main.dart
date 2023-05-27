import 'package:agro_assist/allProviders/models.dart';
import 'package:agro_assist/allProviders/settings_provider.dart';
import 'package:agro_assist/screens/no_internet/noInternet.dart';
import 'package:agro_assist/splash_screen.dart';
import 'package:agro_assist/translation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import 'allProviders/network_service.dart';

///receive message when app is in background solution for onn message
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // LocalNotificationService.initialize();
  // await EasyLocalization.ensureInitialized();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// 1.2: set navigator key to ZegoUIKitPrebuiltCallInvitationService
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  SharedPreferences prefs = await SharedPreferences.getInstance();

  ZegoUIKit().initLog().then((value) {
    runApp(
      // MyApp(
      //   pres: prefs,
      // ),
      MyApp(pres: prefs, navigatorKey: navigatorKey),
    );
  });
}

final CollectionReference users =
    FirebaseFirestore.instance.collection('users');

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final SharedPreferences pres;
  MyApp({required this.pres, required this.navigatorKey});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SettingsProvider>(
            create: (_) => SettingsProvider(
                prefs: this.pres,
                firebaseFirestore: this.firebaseFirestore,
                firebaseStorage: this.firebaseStorage)),
        ChangeNotifierProvider(
          create: (_) => Models(),
        ),

        ///for the internet connection error page
        StreamProvider(
            create: (context) => NetworkService().controller.stream,
            initialData: NetworkStatus.online),
      ],
      child: GetMaterialApp(
        navigatorKey: navigatorKey,
        // localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        //   DefaultWidgetsLocalizations.delegate,
        //   DefaultMaterialLocalizations.delegate,
        // ],
        //
        // localizationsDelegates: context.localizationDelegates,
        //
        // supportedLocales: context.supportedLocales,
        // locale: context.locale,
        locale: const Locale('en', 'US'),
        translations: Translation(),
        theme: ThemeData(brightness: Brightness.light),
        debugShowCheckedModeBanner: false,
        title: 'AgroAssist',
        // builder: (_, child) => Unfocus(
        //   child: child!,
        // ),
        home:
            // ChatPageScreen(),
            const InternetConnectionScreen(child: MySplashScreen()),
        // MyRichApp(),
        // const Registration(),
        // Introduction()
      ),
    );
  }
}
