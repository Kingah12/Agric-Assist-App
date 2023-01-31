import 'dart:convert';

import 'package:agro_assist/model/agro_news.dart';
import 'package:agro_assist/model/category_model.dart';
import 'package:agro_assist/model/category_news.dart';
import 'package:agro_assist/model/news_data.dart';
import 'package:agro_assist/model/news_model.dart';
import 'package:agro_assist/screens/chat_page_screen.dart';
import 'package:agro_assist/screens/citySearch.dart';
import 'package:agro_assist/screens/log_in.dart';
import 'package:agro_assist/screens/timeline_screen.dart';
import 'package:agro_assist/screens/welcome_page.dart';
import 'package:agro_assist/splash_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:koukicons/cloudWarning.dart';
import 'package:koukicons/location.dart';
import 'package:koukicons/manager.dart';
import 'package:koukicons/scatterPlot.dart';
import 'package:koukicons/speed.dart';
import 'package:koukicons/workflow.dart';

import '../models_auths/models.dart';
import '../select_location_page.dart';
import 'Local_news_pages/local_news_category.dart';
import 'contactUs.dart';
import 'location_details.dart';

class HomePage extends StatefulWidget {
  final dynamic currentCity;

  const HomePage({
    Key? key,
    required this.currentCity,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  List<NewsArticle> newsArticle = <NewsArticle>[];
  List<NewsArticle> newsCategory = <NewsArticle>[];
  List<CategoryModel> category = getCategoryNews();
  late String _cityName = 'Ezere';
  double? latitude;
  double? longitude;
  bool _loading = false;
  int index = 0;
  dynamic? temperature;
  dynamic? condition;
  dynamic? weatherDescription;
  int? year1;
  int? month1;
  int? day1;
  int? newDay;
  double? soilMoistureData;
  String tractability = "No".tr();
  late String agroText;
  int? statusCode;
  String currentUserUid = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getPosition();
    category = getCategoryNews();
    getNews();

    ///gives you the message on which user taps on it
    ///and it openedthe app from terminated state
    // FirebaseMessaging.instance.getInitialMessage().then((message) {
    //   if (message != null) {
    //     // final routeFromMessage = message.data["route"];
    //     Navigator.push(context, MaterialPageRoute(builder: (context) {
    //       return LocalNews();
    //     }));
    //   }
    // });
    //
    // ///forground work
    // FirebaseMessaging.onMessage.listen((message) {
    //   if (message.notification != null) {
    //     LocalNotificationService.display(message);
    //   }
    // });
    //
    // ///this only works when the app is in background but opened and user taps
    // ///on the notification
    // FirebaseMessaging.onMessageOpenedApp.listen((message) {
    //   final routeFromeMessage = message.data['route'];
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    //     return LocalNews();
    //   }));
    // });
  }

  setUserStatus(String status) async {
    await model.usersRef.doc(currentUserUid).update({
      'status': status,
      'lastSeen': DateTime.now(),
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    if (state == AppLifecycleState.resumed) {
      setUserStatus('Online');
    } else {
      setUserStatus('offline');
    }
  }

  ///subtracting 1 from today to fill up datas for weather bit
  void remove1fromToday() {
    try {
      setState(() {
        var newDay1 = day1! - 1;
        newDay = newDay1;
        print("newDay:" "$newDay");
      });
    } catch (e) {
      e.toString();
    }
  }

  ///check for index
  void checkForIndex() {
    setState(() {
      _cityName = widget.currentCity;
    });

    if (_cityName == "Agbogugu") {
      return setState(() {
        index = 0;
      });
    } else if (_cityName == "Amoli") {
      return setState(() {
        index = 1;
      });
    } else if (_cityName == "Awgu") {
      return setState(() {
        index = 2;
      });
    } else if (_cityName == "Ezere") {
      return setState(() {
        index = 3;
      });
    } else if (_cityName == "Mgbidi") {
      return setState(() {
        index = 4;
      });
    } else if (_cityName == "Ihe") {
      return setState(() {
        index = 5;
      });
    } else if (_cityName == "Mgbowo") {
      return setState(() {
        index = 6;
      });
    } else if (_cityName == "Mmaku") {
      return setState(() {
        index = 7;
      });
    } else if (_cityName == "Nkwe") {
      return setState(() {
        index = 8;
      });
    } else {
      return setState(() {
        index = 0;
      });
    }
  }

  ///get position
  getPosition() async {
    _loading = true;
    try {
      Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .catchError((e) {
        displayToast(context, e.code, Colors.red, Colors.white);
      });
      latitude = position.latitude;
      longitude = position.longitude;

      checkDate();
      remove1fromToday();
      getWeatherBitData();
      getSoilMoistureData();
    } catch (e) {
      e.toString();
    }
  }

  ///check datas
  void checkDate() {
    // int month = DateTime.utc(2022, []) as int;
    int month = DateTime.now().month;
    int year = DateTime.now().year;
    int day = DateTime.now().day;

    setState(() {
      year1 = year;
      month1 = month;
      day1 = day;
    });
  }

  ///get weather bit datas
  getWeatherBitData() async {
    String apiKey = '912fefefec9f400b97c135bb5928d6c6';
    String api2Key = 'a8fee4b1f36843f8a0524d7646215a46';
    // String api3Key = 'f96b792d35584262a1eedd716d88be6f';
    String api3Key = 'c1a22e967a864903ad39d097ec8b1bf3';

    String weatherDataUrl =
        'https://api.weatherbit.io/v2.0/current?lat=$latitude&lon=$longitude&key=$api3Key';
    http.Response response = await http.get(Uri.parse(weatherDataUrl));

    try {
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(longitude);
        print(latitude);
        String data = response.body;
        setState(() {
          temperature = jsonDecode(data)['data'][0]['temp'];
          condition = jsonDecode(data)['data'][0]['weather']['code'];
          weatherDescription =
              jsonDecode(data)['data'][0]['weather']['description'];
          setState(() {
            _loading = false;
            statusCode = response.statusCode;
          });
          print(response.statusCode);
        });
      } else {
        setState(() {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const WelcomePage();
          }));
        });
        displayToast(
            context,
            'The weather api is down, please check back in 2 minutes time.'
                .tr(),
            Colors.red,
            Colors.white);
      }
    } catch (e) {
      displayToast(context, '${e.toString()}', Colors.red, Colors.white);
    }
  }

  ///get soil moisture
  getSoilMoistureData() async {
    String apikey = '912fefefec9f400b97c135bb5928d6c6';
    String api2key = 'a8fee4b1f36843f8a0524d7646215a46';
    // String api3key = 'f96b792d35584262a1eedd716d88be6f';
    String api3key = 'c1a22e967a864903ad39d097ec8b1bf3';

    String url =
        'https://api.weatherbit.io/v2.0/history/agweather?lat=$latitude&lon=$longitude&start_date=$year1-$month1-$newDay&end_date=$year1-$month1-$day1&key=$api3key';

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      var soilM = jsonDecode(data)['data'][0]['v_soilm_0_10cm'];
      setState(() {
        soilMoistureData = soilM;
      });
    }
    setTractability();
    print('this is the soilmoisture data: $soilMoistureData');
  }

  ///set tractability
  setTractability() {
    if (soilMoistureData! >= 0.6008) {
      setState(() {
        tractability = "No";
      });
    } else {
      setState(() {
        tractability = 'Yes';
      });
    }
  }

  getNews() async {
    NewsData newsClass = NewsData();
    await newsClass.getNewsArticle();
    newsArticle = newsClass.news.cast<NewsArticle>();
  }

  ///refreshing homePage
  Future<void> refreshAllDatas() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomePage(
        currentCity: widget.currentCity,
      );
    }));
  }

  ///buildContext builds
  @override
  Widget build(BuildContext context) {
    checkForIndex();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        ///drawer
        drawer: Drawer(
          elevation: 10,
          child: Column(
            children: [
              Container(
                  decoration: const BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('assets/po.jpg'))),
                  width: double.infinity,
                  height: 200,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20),
                      child: FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection('users')
                            .where('uid', isEqualTo: auth.currentUser!.uid)
                            .get(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          var data = snapshot.data!.docs;
                          try {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return Text(
                                      '${data[index]['nickname']}',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800),
                                    );
                                  });
                            }
                          } catch (e) {
                            e.toString();
                          }
                          return Container();
                        },
                      ),
                    ),
                  )),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              InkWell(
                onTap: () async {
                  var typedName = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CitySearch()));
                  debugPrint(typedName);
                },
                child: ListTile(
                  leading: const Icon(Icons.location_city_outlined,
                      color: Colors.black),
                  title: Text('Search By Location'.tr(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactUsPage()));
                },
                child: ListTile(
                  leading: const Icon(Icons.contact_page_outlined,
                      color: Colors.black),
                  title: Text('Contact Us'.tr(),
                      style:
                          const TextStyle(color: Colors.black, fontSize: 16)),
                ),
              ),
              ListTile(
                onTap: () {
                  signOut(context);
                },
                leading: const Icon(
                  Icons.logout_outlined,
                  color: Colors.black,
                  size: 20,
                ),
                title: Text(
                  'Log Out'.tr(),
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),

        ///body
        body: _loading == true

            ///loading weather page
            ? Stack(
                children: [
                  Positioned(
                    bottom: 40,
                    right: 10,
                    child: FloatingActionButton(
                      backgroundColor: Colors.lightGreen,
                      child: const Icon(
                        Icons.refresh,
                        size: 25,
                      ),
                      onPressed: () {
                        displayToast(context, 'Refreshing home page'.tr(),
                            Colors.black38, Colors.white);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage(
                            currentCity: widget.currentCity,
                          );
                        }));
                      },
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          color: Colors.green,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Please wait...'.tr(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              )

            ///main Home Page
            : RefreshIndicator(
                onRefresh: refreshAllDatas,
                child: Builder(
                  builder: (context) {
                    return SafeArea(
                      child: ListView(
                          physics: const ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          children: [
                            Column(
                              children: [
                                const SizedBox(height: 10),
                                title(),
                                const SizedBox(height: 4),
                                // newsText(),
                                const SizedBox(height: 7),
                                agroSlider(),
                                const SizedBox(height: 50),
                                locationDetails(),
                              ],
                            )
                          ]),
                    );
                  },
                ),
              ),
      ),
    );
  }

  ///title
  Widget title() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      child: Builder(builder: (context) {
        return Row(
          children: [
            GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(Icons.list)),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Agro assist',
              style: kTextStyle,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CitySearch
                            // WelcomePage
                            ()));
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.location_city_outlined),
              ),
            ),
            // CircleAvatar(backgroundImage: NetworkImage(url),),
          ],
        );
      }),
    );
  }

  ///agro slider
  Widget agroSlider() {
    return CarouselSlider(
      items: [
        agrowN(
            img: 'assets/Farmer2.png',
            stuff: 'News'.tr(),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AgroNews();
              }));
            },
            color: Colors.white),
        agrowN(
            img: 'assets/image.png',
            stuff: 'Timeline'.tr(),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const TimeLineSection();
              }));
            },
            color: Colors.black),
        agrowN(
            img: 'assets/images2.jpg',
            stuff: 'chat'.tr(),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ChatPageScreen();
                // return ChatPage();
              }));
            },
            color: Colors.white),
        agrowN(
          img: 'assets/news.jpg',
          stuff: '(Local) News'.tr(),
          color: Colors.white,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LocalNews();
            }));
          },
        )
      ],
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        // onScrolled: ,
      ),
    );
  }

  ///agro news
  Widget agrowN(
      {required img, required stuff, required onPressed, required color}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(img)),
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  // color: Colors.black26,
                  borderRadius: BorderRadius.circular(30)),
              height: 200,
              width: 400,
            ),
            Positioned(
              left: 15,
              bottom: 10,
              child: Row(
                children: [
                  Text(
                    'Agro Assist $stuff',
                    style: TextStyle(color: color, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 16,
              bottom: 10,
              child: Container(
                height: 40,
                width: 65,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.5),
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///location details
  Widget locationDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
            child: Text(
              'Location Details'.tr(),
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 18),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cityDetail(
                        text: 'Current city'.tr(),
                        icon: KoukiconsLocation(
                          height: 30,
                          width: 30,
                        ),
                        trl: widget.currentCity,
                        colr: Colors.grey.shade600),
                    cityDetail(
                        text: 'Markets'.tr(),
                        icon: KoukiconsManager(
                          height: 30,
                          width: 30,
                        ),
                        trl: ld[index].markets,
                        colr: Colors.green),
                    cityDetail(
                        text: 'Rainfall'.tr(),
                        icon: KoukiconsCloudWarning(
                          height: 30,
                          width: 30,
                        ),
                        trl: '$condition ($weatherDescription)',
                        colr: Colors.red),
                    cityDetail(
                        text: 'Current Temperature'.tr(),
                        icon: KoukiconsScatterPlot(
                          height: 40,
                          width: 40,
                        ),
                        trl: "$temperature\u00B0C",
                        colr: Colors.blue),
                    cityDetail(
                        text: 'Soil Type Temperature'.tr(),
                        icon: KoukiconsSpeed(
                          height: 30,
                          width: 30,
                        ),
                        trl: ld[index].soilType,
                        colr: Colors.brown),
                    cityDetail(
                        text: 'Soil pH range'.tr(),
                        icon: KoukiconsWorkflow(
                          height: 30,
                          width: 30,
                        ),
                        trl: ld[index].soilPh,
                        colr: Colors.brown),
                    cityDetail(
                        text: 'AVB'.tr(),
                        icon: KoukiconsCloudWarning(
                          height: 30,
                          width: 30,
                        ),
                        trl: ld[index].availableWaterBodies,
                        colr: Colors.lightBlueAccent),
                    cityDetail(
                        text: 'Tractability'.tr(),
                        icon: KoukiconsWorkflow(
                          height: 30,
                          width: 30,
                        ),
                        trl: tractability,
                        colr: Colors.blue),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        getPosition();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LocationDetails(
                            rainfall: condition,
                          );
                        }));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, top: 13),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.green),
                            child: Center(
                              child: Text(
                                'Check for more details here'.tr(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ])),
        ],
      ),
    );
  }

  ///cityDetails
  Widget cityDetail({required String text, required Widget icon, trl, colr}) {
    return ListTile(
      leading: icon,
      title: Text(
        text,
        style: kSoilStyle.copyWith(fontSize: 12),
      ),
      trailing: Text(
        trl,
        style: kSoilStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 13,
          color: colr,
        ),
      ),
    );
  }

  ///newsText (test Run)
  Widget newsText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 1),
      child: Row(
        children: [
          Text(
            '$latitude, ',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '$longitude',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(
            width: 5,
          ),
          Column(
            children: [
              Text(
                '$soilMoistureData',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              Text(
                '$year1',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              Text(
                '$month1',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
              Text(
                '$day1',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Future<Position?> determinePosition() async {
  //   // Determine the current position of the device.
  //   ///
  //   /// When the location services are not enabled or permissions
  //   /// are denied the `Future` will return an error.
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error(() {
  //       displayToast(context, "please turn on your location and try again",
  //           Colors.black, Colors.white);
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) {
  //         return const WelcomePage();
  //       }));
  //     });
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error(() {
  //         displayToast(context, 'please check your location'.tr(), Colors.black,
  //             Colors.white);
  //         Navigator.pushReplacement(context,
  //             MaterialPageRoute(builder: (context) {
  //           return const WelcomePage();
  //         }));
  //       });
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(() {
  //       displayToast(context, 'please check your location'.tr(), Colors.black,
  //           Colors.white);
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) {
  //         return const WelcomePage();
  //       }));
  //     });
  //   }
  //
  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   // Position? position = await Geolocator.getCurrentPosition(
  //   //     desiredAccuracy: LocationAccuracy.high);
  //   // latitude = position.latitude;
  //   // longitude = position.longitude;
  //   // return position;
  // }
}

const kSoilStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 14.5);

const kTextStyle = TextStyle(fontWeight: FontWeight.w900, fontSize: 30);
