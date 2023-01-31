import 'package:agro_assist/select_location_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';

import '../splash_screen.dart';
import 'log_in.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
    print(user?.email);
    print(gUser?.email);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10.0, top: 0, bottom: 12, right: 20),
          child: Text(
            'Welcome to Agro Assist'.tr(),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 20),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
          child: Text(
            "welcome_Note".tr(),
            style: const TextStyle(
                fontWeight: FontWeight.w500, wordSpacing: 3, height: 1.5),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SelectLocationPage();
            }));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 15),
            child: Align(
              alignment: Alignment.centerRight,
              child: Material(
                borderRadius: BorderRadius.circular(40),
                elevation: 12,
                child: Container(
                  alignment: Alignment.centerRight,
// margin: const EdgeInsets.only(left: 200, top: 20, right: 15),
                  height: 47,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(40))),
                  child: Center(
                      child: Text(
                    'Proceed'.tr(),
                    style: const TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  )),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
