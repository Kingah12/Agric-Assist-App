import 'package:agro_assist/model/location_details.dart';
import 'package:agro_assist/screens/home_page.dart';
import 'package:agro_assist/screens/log_in.dart';
import 'package:agro_assist/screens/no_internet/noInternet.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'allProviders/models.dart';

// int index = 0;

var ld = locationDetailsItems;

// extension IndexInterable<E> on Iterable<E> {
//   Iterable<T> indexedMap<T>(T Function(E element, int index) f) {
//     return map((e) => f(e, index++));
//   }
// }

class SelectLocationPage extends StatefulWidget {
  const SelectLocationPage({Key? key}) : super(key: key);

  @override
  _SelectLocationPageState createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  String sItem = 'select location'.tr;

  @override
  Widget build(BuildContext context) {
    return InternetConnectionScreen(
      child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.white,
          //   elevation: 0,
          //   leading: GestureDetector(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: const Icon(
          //       Icons.arrow_back_ios_outlined,
          //       color: Colors.black,
          //       size: 25,
          //     ),
          //   ),
          // ),
          body: Container(
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        width: 200,
                        child: Image(image: AssetImage('assets/logo.png'))),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Please select your Location'.tr,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AwesomeDropDown(
                      selectedItemTextStyle: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          letterSpacing: 1.3),
                      dropDownListTextStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                      isPanDown: true,
                      dropDownList: locationDetailsItems
                          .map((e) => e.currentcity)
                          .toList(),
                      elevation: 20,
                      onDropDownItemClick: (value) {
                        var ld = locationDetailsItems;
                        setState(() {
                          sItem = value;
                          // print(ld);
                        });
                      },
                      dropDownTopBorderRadius: 40,
                      selectedItem: sItem,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (sItem.contains('select location'.tr)) {
                          displayToast(context, 'please select a location'.tr,
                              Colors.black54, Colors.white);
                          // Provider.of<Models>(context, listen: false)
                          //     .setUserName(currentUsersUserName);
                          // Provider.of<Models>(context, listen: false)
                          //     .setUserProfilePic(currentUserProfilePic);
                        } else {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return HomePage(
                              currentCity: sItem,
                            );
                          }));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 20),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              alignment: Alignment.centerRight,
// margin: const EdgeInsets.only(left: 200, top: 20, right: 15),
                              height: 47,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.green.shade600,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(40))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.arrow_forward_outlined,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    'Next'.tr,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 1.2,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
