import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../allProviders/network_service.dart';
import '../custom_widgets/custom_text.dart';
import '../log_in.dart';

class InternetConnectionScreen extends StatefulWidget {
  final Widget child;
  const InternetConnectionScreen({Key? key, required this.child})
      : super(key: key);

  @override
  State<InternetConnectionScreen> createState() =>
      _InternetConnectionScreenState();
}

class _InternetConnectionScreenState extends State<InternetConnectionScreen> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    // TODO: implement initState
    getConnectivity();
    super.initState();
  }

  getConnectivity() => subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          displayToast(context, 'no internet ', Colors.red, Colors.white);
          showDialogBox();
          setState(() {
            isAlertSet = true;
          });
        } else if (isDeviceConnected) {
          displayToast(context, 'internet available ', Colors.lightGreenAccent,
              Colors.black);
        }
      });
  @override
  void dispose() {
    // TODO: implement dispose
    subscription.cancel();
    super.dispose();
  }

  showDialogBox() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 90),
            Image.asset(
              "assets/noint.png",
              scale: 1,
            ),
            const SizedBox(height: 70),
            const Text(
              'Ooops!',
              style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                  fontSize: 30),
            ),
            // const CustomTextWidget(
            //   text: "No internet Connection",
            //   textColor: Colors.white,
            //   textSize: 18.0,
            //   weight: FontWeight.w600,
            // ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              width: 300,
              child: CustomTextWidget(
                textSize: 14.5,
                textColor: Colors.grey,
                text: "Slow or no internet connection,",
                weight: FontWeight.w500,
              ),
            ),

            const CustomTextWidget(
              text: "Check your internet settings.",
              textSize: 14.5,
              textColor: Colors.grey,
              weight: FontWeight.w500,
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                // Navigator.pop(context);
                setState(() {
                  isAlertSet = false;
                });
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected) {
                  setState(() {
                    isAlertSet = true;
                  });
                  openSnackbar();
                }
              },
              child: Container(
                margin: const EdgeInsets.only(top: 2),
                height: 40,
                width: 125.0,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.green)),
                child: const Center(
                  child: CustomTextWidget(
                    text: "Refresh",
                    textColor: Colors.white,
                    weight: FontWeight.bold,
                    textSize: 17,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openSnackbar() {
    Get.snackbar("No internet connection",
        "Please check your internet connection then tap the refresh button",
        colorText: Colors.white,
        icon: const Icon(
          Icons.signal_wifi_off_outlined,
          color: Colors.white,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green);
  }

  @override
  Widget build(BuildContext context) {
    var networkStatus = Provider.of<NetworkStatus>(context);
    return isAlertSet == false
        ? networkStatus == NetworkStatus.offline
            ? Scaffold(
                backgroundColor: Colors.white,
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 90),
                      Image.asset(
                        "assets/noint.png",
                        scale: 2.5,
                      ),
                      const SizedBox(height: 70),
                      const Text(
                        'Ooops!',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                            fontSize: 30),
                      ),
                      // const CustomTextWidget(
                      //   text: "No internet Connection",
                      //   textColor: Colors.white,
                      //   textSize: 18.0,
                      //   weight: FontWeight.w600,
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        width: 300,
                        child: CustomTextWidget(
                          textSize: 14.5,
                          textColor: Colors.grey,
                          text: "Slow or no internet connection,",
                          weight: FontWeight.w500,
                        ),
                      ),

                      const CustomTextWidget(
                        text: "Check your internet settings.",
                        textSize: 14.5,
                        textColor: Colors.grey,
                        weight: FontWeight.w500,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () async {
                          // Navigator.pop(context);
                          setState(() {
                            isAlertSet = false;
                          });
                          isDeviceConnected =
                              await InternetConnectionChecker().hasConnection;
                          if (!isDeviceConnected) {
                            setState(() {
                              isAlertSet = true;
                            });
                            openSnackbar();
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 2),
                          height: 40,
                          width: 125.0,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.green)),
                          child: const Center(
                            child: CustomTextWidget(
                              text: "TRY AGAIN",
                              textColor: Colors.white,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : widget.child
        : showDialogBox();
  }
}
