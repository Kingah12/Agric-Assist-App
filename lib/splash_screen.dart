import 'package:agro_assist/screens/log_in.dart';
import 'package:agro_assist/screens/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:splash_screen_view/SplashScreenView.dart';


final FirebaseAuth auth = FirebaseAuth.instance;

final User? user = auth.currentUser;

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    determinePosition();
  }

  Future<Position?> determinePosition() async {
    // Determine the current position of the device.
    ///
    /// When the location services are not enabled or permissions
    /// are denied the `Future` will return an error.
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error(() {
        displayToast(context, "please turn on your location and try again",
            Colors.black, Colors.white);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const WelcomePage();
        }));
      });
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error(() {
          displayToast(context, 'please check your location', Colors.black,
              Colors.white);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const WelcomePage();
          }));
        });
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(() {
        displayToast(
            context, 'please check your location', Colors.black, Colors.white);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const WelcomePage();
        }));
      });
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // Position? position = await Geolocator.getCurrentPosition(
    //     desiredAccuracy: LocationAccuracy.high);
    // latitude = position.latitude;
    // longitude = position.longitude;
    // return position;
  }

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
