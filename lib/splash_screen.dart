import 'package:agro_assist/screens/home_page.dart';
import 'package:agro_assist/screens/log_in.dart';
import 'package:agro_assist/screens/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:flutter/material.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

final User? user = auth.currentUser;

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: user != null ? const WelcomePage() : const Log_In(),
      duration: 5000,
      imageSize: 200,
      imageSrc: "assets/logo.png",
      text: "Agro Assist",
      textType: TextType.TyperAnimatedText,
      textStyle: const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w600,
      ),
      backgroundColor: Colors.white,
    );
  }
}
