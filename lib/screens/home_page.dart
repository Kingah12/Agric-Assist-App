import 'dart:convert';

import 'package:agro_assist/model/agro_news.dart';
import 'package:agro_assist/model/category_model.dart';
import 'package:agro_assist/model/category_news.dart';
import 'package:agro_assist/model/news_data.dart';
import 'package:agro_assist/model/news_model.dart';
import 'package:agro_assist/screens/chat_page_screen.dart';
import 'package:agro_assist/screens/log_in.dart';
import 'package:agro_assist/screens/timeline_screen.dart';
import 'package:agro_assist/screens/welcome_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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

import '../select_location_page.dart';
import '../services/local_notifications.dart';
import '../splash_screen.dart';
import 'Local_news_pages/local_news_category.dart';
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

class _HomePageState extends State<HomePage> {
  List<NewsArticle> newsArticle = <NewsArticle>[];
  List<NewsArticle> newsCategory = <NewsArticle>[];
  List<CategoryModel> category = getCategoryNews();
  late String _cityName = 'Ezere';
  double? latitude;
  double? longitude;
  bool _loading = true;
  int index = 0;
  dynamic? temperature;
  dynamic? condition;
  int? year1;
  int? month1;
  int? day1;
  double? soilMoistureData;
  String tractability = "No";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _determinePosition();

    getPosition();

    category = getCategoryNews();
    getNews();

    ///gives you the message on which user taps on it
    ///and it openedthe app from terminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        // final routeFromMessage = message.data["route"];
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LocalNews();
        }));
      }
    });

    ///forground work
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        LocalNotificationService.display(message);
      }
    });

    ///this only works when the app is in background but opened and user taps
    ///on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromeMessage = message.data['route'];
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LocalNews();
      }));
    });
  }

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

  Future<Position?> _determinePosition() async {
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
    Position? position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
    return position;
  }

  getPosition() async {
    // _loading = false;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
    checkDate();
    getWeatherBitData();
    getSoilMoistureData();
  }

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

  getWeatherBitData() async {
    String apiKey = '912fefefec9f400b97c135bb5928d6c6';
    String weatherDataUrl =
        'https://api.weatherbit.io/v2.0/current?lat=$latitude&lon=$longitude&key=$apiKey';
    http.Response response = await http.get(Uri.parse(weatherDataUrl));

    if (response.statusCode == 200) {
      String data = response.body;
      setState(() {
        temperature = jsonDecode(data)['data'][0]['temp'];
        condition = jsonDecode(data)['data'][0]['weather']['code'];
        _loading = false;
      });
    } else {
      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const WelcomePage();
        }));
      });
      displayToast(
          context, 'there is a bad network', Colors.black, Colors.white);
    }
  }

  getSoilMoistureData() async {
    String apikey = '912fefefec9f400b97c135bb5928d6c6';
    String url =
        'https://api.weatherbit.io/v2.0/history/agweather?lat=$latitude&lon=$longitude&start_date=2022-06-10&end_date=$year1-$month1-$day1&key=$apikey';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;

      var soilM = jsonDecode(data)['data'][0]['v_soilm_0_10cm'];
      setState(() {
        soilMoistureData = soilM;
      });
    }
    print(response.statusCode);
    setTractability();
    print('this is the soilmoisture data: $soilMoistureData');
  }

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

  @override
  Widget build(BuildContext context) {
    checkForIndex();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        drawer: Drawer(
          elevation: 10,
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.black26,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 40.0, horizontal: 20),
                    child: Text('${auth.currentUser!.email}'),
                  )),
              const Divider(
                color: Colors.grey,
                thickness: 1,
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
                title: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.settings_sharp,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const WelcomePage();
            }));
          },
          elevation: 12,
        ),
        body: _loading == true
            ? Stack(
                children: [
                  Positioned(
                    top: 40,
                    right: 2,
                    child: GestureDetector(
                      onTap: () {
                        displayToast(context, 'Refreshing home page',
                            Colors.black38, Colors.white);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HomePage(
                            currentCity: widget.currentCity,
                          );
                        }));
                      },
                      child: const Icon(
                        Icons.refresh,
                        size: 25,
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(
                          color: Colors.green,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Please wait...',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 16),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Builder(builder: (context) {
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
                            newsText(),
                            const SizedBox(height: 7),
                            agroSlider(),
                            const SizedBox(height: 50),
                            locationDetails(),
                          ],
                        )
                      ]),
                );
              }),
      ),
    );
  }

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
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WelcomePage()));
                },
                icon: Icon(CupertinoIcons.arrow_left_circle))
            // CircleAvatar(backgroundImage: NetworkImage(url),),
          ],
        );
      }),
    );
  }

  Widget agroSlider() {
    return CarouselSlider(
      items: [
        agrowN(
            img: 'assets/Farmer2.png',
            stuff: 'News',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AgroNews();
              }));
            },
            color: Colors.white),
        agrowN(
            img: 'assets/image.png',
            stuff: 'Timeline',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const TimeLineSection();
              }));
            },
            color: Colors.black),
        agrowN(
            img: 'assets/images2.jpg',
            stuff: 'chat',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ChatPageScreen();
                // return ChatPage();
              }));
            },
            color: Colors.white),
        agrowN(
          img: 'assets/news.jpg',
          stuff: '(Local) News',
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
      ),
    );
  }

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

  Widget locationDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
            child: Text(
              'Agro Details',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cityDetail(
                        text: 'Current city',
                        icon: KoukiconsLocation(
                          height: 30,
                          width: 30,
                        ),
                        trl: widget.currentCity,
                        colr: Colors.grey.shade600),
                    cityDetail(
                        text: 'Markets',
                        icon: KoukiconsManager(
                          height: 30,
                          width: 30,
                        ),
                        trl: ld[index].markets,
                        colr: Colors.green),
                    cityDetail(
                        text: 'Rainfall',
                        icon: KoukiconsCloudWarning(
                          height: 30,
                          width: 30,
                        ),
                        trl: '$condition',
                        colr: Colors.red),
                    cityDetail(
                        text: 'Current Temperature',
                        icon: KoukiconsScatterPlot(
                          height: 40,
                          width: 40,
                        ),
                        trl: "$temperature\u00B0C",
                        colr: Colors.blue),
                    cityDetail(
                        text: 'Soil Type Temperature',
                        icon: KoukiconsSpeed(
                          height: 30,
                          width: 30,
                        ),
                        trl: ld[index].soilType,
                        colr: Colors.brown),
                    cityDetail(
                        text: 'Soil pH range',
                        icon: KoukiconsWorkflow(
                          height: 30,
                          width: 30,
                        ),
                        trl: ld[index].soilPh,
                        colr: Colors.brown),
                    cityDetail(
                        text: 'Available Water Bodies',
                        icon: KoukiconsCloudWarning(
                          height: 30,
                          width: 30,
                        ),
                        trl: ld[index].availableWaterBodies,
                        colr: Colors.lightBlueAccent),
                    cityDetail(
                        text: 'Tractability',
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
                          return const LocationDetails();
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
                            child: const Center(
                              child: Text(
                                'Check for more details here...',
                                style: TextStyle(
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

  Widget cityDetail({required String text, required Widget icon, trl, colr}) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
        left: 3.0,
      ),
      child: ListTile(
        leading: icon,
        title: Text(
          text,
          style: kSoilStyle,
        ),
        trailing: Text(
          trl,
          style: kSoilStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: colr,
          ),
        ),
      ),
    );
  }

  Widget newsText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 1),
      child: Row(
        children: const [
          Text(
            'Agro',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            'News',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ],
      ),
    );
  }
}

const kSoilStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 14.5);

const kTextStyle = TextStyle(fontWeight: FontWeight.w900, fontSize: 30);
