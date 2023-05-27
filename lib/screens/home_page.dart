import 'dart:convert';

import 'package:agro_assist/model/News_datas/news_data.dart';
import 'package:agro_assist/model/category_model.dart';
import 'package:agro_assist/model/category_news.dart';
import 'package:agro_assist/model/news_model.dart';
import 'package:agro_assist/screens/chat_page_screen.dart';
import 'package:agro_assist/screens/chat_page_tab_screens/chatScreens/calls_pages/callInvitation.dart';
import 'package:agro_assist/screens/citySearch.dart';
import 'package:agro_assist/screens/log_in.dart';
import 'package:agro_assist/screens/no_internet/noInternet.dart';
import 'package:agro_assist/screens/settings/about_us_page.dart';
import 'package:agro_assist/screens/settings/settings.dart';
import 'package:agro_assist/screens/timeline_screen.dart';
import 'package:agro_assist/screens/welcome_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../allProviders/models.dart';
import '../allProviders/settings_provider.dart';
import '../select_location_page.dart';
import '../splash_screen.dart';
import 'Local_news_pages/agro-News.dart';
import 'Local_news_pages/local_news_category.dart';
import 'contactUs.dart';
import 'custom_widgets/web_scraping.dart';
import 'jobs_services/agro_services_jobs.dart';
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
  double? latitude = 2.5;
  double? longitude = 4.4;
  bool _loading = false;
  int index = 0;
  dynamic? temperature;
  dynamic? condition;
  dynamic? weatherDescription;
  int? year1;
  int? month1;
  int? day1;
  int? newDay;
  double? soilMoistureData = 0.274;
  String tractability = "No".tr;
  late String agroText;
  String currentUsersUserName = '';
  String currentUserProfilePic = '';
  int? statusCode;
  bool weatherLoading = false;
  String currentUserUid = FirebaseAuth.instance.currentUser!.uid;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDatas();
    WidgetsBinding.instance.addObserver(this);
    // getPosition();
    getWeatherBitData();

    ///getting current users name
    onUserLogin();
    getGeoCordinates();
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
    } else if (_cityName == "Oweli") {
      return setState(() {
        index = 9;
      });
    } else {
      return setState(() {
        index = 0;
      });
    }
  }

  // ///get position
  // getPosition() async {
  //   setState(() {
  //     _loading = true;
  //   });
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //             desiredAccuracy: LocationAccuracy.high)
  //         .catchError((e) {
  //       displayToast(context, e.code, Colors.red, Colors.white);
  //     });
  //     setState(() {
  //       latitude = position.latitude;
  //       longitude = position.longitude;
  //     });
  //
  //
  //   } catch (e) {
  //     e.toString();
  //   }
  // }

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
    setState(() {
      _loading = true;
      weatherLoading = true;
    });
    String apiKey = '912fefefec9f400b97c135bb5928d6c6';
    String api2Key = 'a8fee4b1f36843f8a0524d7646215a46';
    String api4Key = 'ee35543509a34985935a3a39f44da15b';
    String api3Key = 'c1a22e967a864903ad39d097ec8b1bf3';
    String api5key = 'e672715bb75245fca9292265bdc6413a';

    String weatherDataUrl =
        'https://api.weatherbit.io/v2.0/current?city=${_cityName}&key=$api5key';
    // 'https://api.weatherbit.io/v2.0/current?lat=$latitude&lon=$longitude&key=$apiKey';
    http.Response response = await http.get(Uri.parse(weatherDataUrl));

    try {
      if (response.statusCode == 200) {
        // print(response.statusCode);
        String data = response.body;
        setState(() {
          temperature = jsonDecode(data)['data'][0]['temp'];
          condition = jsonDecode(data)['data'][0]['weather']['code'];
          weatherDescription =
              jsonDecode(data)['data'][0]['weather']['description'];
          weatherLoading = false;
          statusCode = response.statusCode;
          // getWeatherBitData();
          // getSoilMoistureData();
          // print(response.statusCode);
        });
      } else {
        displayToast(
            context,
            'The weather api is down, please check back in 2 minutes time.'.tr,
            Colors.red,
            Colors.white);
      }
    } catch (e) {
      displayToast(context, '${e.toString()}', Colors.red, Colors.white);
    }
  }

  getGeoCordinates() async {
    ///getCityName before giving soil Moisture the lat and long
    String geoCodingApiKey = 'c735b70922e74c20adf300b7d8554c9e';
    String getLatLongUrl =
        "https://api.geoapify.com/v1/geocode/search?text=$_cityName,Nigeria&apiKey=$geoCodingApiKey";
    http.Response responseLatLong = await http.get(Uri.parse(getLatLongUrl));
    if (responseLatLong.statusCode == 200) {
      print('cordi: ${responseLatLong.statusCode}');
      String data = responseLatLong.body;
      // var soilM = jsonDecode(data)['data'][0]['v_soilm_0_10cm'];
      // features[0].properties.lon
      var longitudes = jsonDecode(data)["features"][0]["properties"]['lon'];
      var latitudes = jsonDecode(data)["features"][0]["properties"]['lat'];
      // var latitudes = jsonDecode(data)["results"][0]["lat"];

      setState(() {
        print('latlat: ${latitudes}');
        print('longlong: ${longitudes}');
        latitude = latitudes;
        longitude = longitudes;
      });
      checkDate();
      remove1fromToday();
      getSoilMoistureData();
    }
  }

  ///get soil moisture
  getSoilMoistureData() async {
    String apikey = '912fefefec9f400b97c135bb5928d6c6';
    String api2key = 'a8fee4b1f36843f8a0524d7646215a46';
    String api4key = 'ee35543509a34985935a3a39f44da15b';
    String api3key = 'c1a22e967a864903ad39d097ec8b1bf3';
    String api5key = 'e672715bb75245fca9292265bdc6413a';

    ///passing the lat and lon to the soil moisture
    String url =
        'https://api.weatherbit.io/v2.0/history/agweather?lat=$latitude&lon=$longitude&start_date=$year1-$month1-$newDay&end_date=$year1-$month1-$day1&key=$api5key';

    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('soilM: ${response.statusCode}');
      String data = response.body;
      var soilM = jsonDecode(data)['data'][0]['v_soilm_0_10cm'];
      setState(() {
        soilMoistureData = soilM;
        _loading = false;
        print('soilM: ${response.statusCode}');
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

  fetchDatas() {
    ///getting current users datas

    final firestore = FirebaseFirestore.instance;
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;

    ///fetching userType Data eg: user or recruiter
    firestore.collection('users').doc(currentUserId).get().then((value) {
      var fields = value.data();
      setState(() {
        currentUsersUserName = fields!['nickname'];
        currentUserProfilePic = fields['photoUrl'];
        // currentUsersId = fields['uid'];
      });
    });
    // // Provider.of<Models>(context, listen: false)
    //     .setUserName(currentUsersUserName);
    //
    // Provider.of<Models>(context).setUserProfilePic(currentUserProfilePic);
    // Provider.of<Models>(context).setUserName(currentUsersUserName);
  }

  void onUserLogin() {
    /// 2.1. initialized ZegoUIKitPrebuiltCallInvitationService
    /// when app's user is logged in or re-logged in
    /// We recommend calling this method as soon as the user logs in to your app.
    ZegoUIKitPrebuiltCallInvitationService().init(
        notifyWhenAppRunningInBackgroundOrQuit: true,
        // appID: 712545703,
        appID: 1014199522,
        appSign:
            "379c89c11ea67772f36569337f0854e975028daed1f12073c6bb42eb5b4a1fc8",
        // appSign:
        //     "c3c2e49f6352bccd98cb45d7460fcba7ccc50f57a336ed0a7ef70eac8177f023",
        userID: currentUserUid,
        userName: currentUsersUserName,
        // child: widget.child,
        plugins: [ZegoUIKitSignalingPlugin()]);
  }

  ///refreshing homePage
  Future<void> refreshAllDatas() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return HomePage(
        currentCity: widget.currentCity,
      );
    })).then((value) => displayToast(
        context, 'Refreshing weather datas', Colors.black38, Colors.white));
  }

  DateTime backPressedTime = DateTime.now();

  ///buildContext builds
  @override
  Widget build(BuildContext context) {
    checkForIndex();
    // onUserLogin();
    // getGeoCordinates();
    return WillPopScope(
      onWillPop: () => onBackButtonPressed(context, backPressedTime),
      child: InternetConnectionScreen(
        child: Scaffold(
          ///drawer
          drawer: Drawer(
            elevation: 2,
            child: Column(
              children: [
                ///circle avatar
                Container(
                  decoration: const BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage('assets/po.jpg'))),
                  width: double.infinity,
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 70.0,
                      left: 10.0,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.green,
                          backgroundImage: CachedNetworkImageProvider(
                              currentUserProfilePic.toString()),
                          // child: const Icon(Icons.person, size: 30),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                currentUsersUserName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    leadingDistribution:
                                        TextLeadingDistribution.even,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800),
                              ),
                              Text(
                                '${auth.currentUser!.email}',
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),

                ///search by locations
                InkWell(
                  onTap: () async {
                    var typedName = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CitySearch()));
                    debugPrint(typedName);
                  },
                  child: ListTile(
                    leading: const Icon(CupertinoIcons.location,
                        color: Colors.black),
                    title: Text('Search By Location'.tr,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ),

                ///contact us page
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ContactUsPage()));
                  },
                  child: ListTile(
                    leading:
                        const Icon(CupertinoIcons.phone, color: Colors.green),
                    title: Text('Contact Us'.tr,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ),

                ///Settings Page
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsPageAgro()));
                  },
                  child: ListTile(
                    leading:
                        const Icon(CupertinoIcons.settings, color: Colors.blue),
                    title: Text('Settings'.tr,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUsPage()));
                  },
                  child: ListTile(
                    leading: const Icon(CupertinoIcons.person_2_alt,
                        color: Colors.black),
                    title: Text('About App'.tr,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                ),

                ///About Page

                ///log out button
                ListTile(
                  onTap: () {
                    signOut(context);
                    ZegoUIKitPrebuiltCallInvitationService().uninit();
                  },
                  leading: const Icon(
                    Icons.logout_outlined,
                    color: Colors.red,
                    size: 20,
                  ),
                  title: Text(
                    'Log Out'.tr,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),

                // ///WEB SCRAPING
                // ListTile(
                //   onTap: () {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) {
                //       return const AgNewsWebScrape();
                //     }));
                //   },
                //   leading: const Icon(
                //     Icons.logout_outlined,
                //     color: Colors.black,
                //     size: 20,
                //   ),
                //   title: Text(
                //     'Log Out'.tr,
                //     style: const TextStyle(color: Colors.black, fontSize: 16),
                //   ),
                // ),
              ],
            ),
          ),

          ///body
          body:
              // _loading == true
              //
              //     ///loading weather page
              //     ? RefreshIndicator(
              //         onRefresh: refreshAllDatas,
              //         child: Stack(
              //           children: [
              //             Positioned(
              //               bottom: 40,
              //               right: 10,
              //               child: FloatingActionButton(
              //                 backgroundColor: Colors.lightGreen,
              //                 child: const Icon(
              //                   Icons.refresh,
              //                   size: 25,
              //                 ),
              //                 onPressed: () {
              //                   displayToast(context, 'Refreshing home page'.tr,
              //                       Colors.black38, Colors.white);
              //                   Navigator.pushReplacement(context,
              //                       MaterialPageRoute(builder: (context) {
              //                     return HomePage(
              //                       currentCity: widget.currentCity,
              //                     );
              //                   }));
              //                 },
              //               ),
              //             ),
              //             Center(
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   const CircularProgressIndicator(
              //                     color: Colors.green,
              //                   ),
              //                   const SizedBox(height: 20),
              //                   Text(
              //                     'Please wait...'.tr,
              //                     style: const TextStyle(
              //                         fontWeight: FontWeight.w900, fontSize: 16),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       )

              ///main Home Page
              // :
              RefreshIndicator(
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
                            // Text(
                            //     '${currentUserUid} ${currentUsersUserName}'),
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
              width: 15,
            ),
            SizedBox(
                width: 50, height: 50, child: Image.asset('assets/icon.png')),
            const SizedBox(
              width: 5,
            ),
            const Text(
              'AgricassistApp',
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
            img: 'assets/agrow.png',
            stuff: 'Service/Jobs'.tr,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AgroService_Jobs()));
            },
            color: Colors.white),
        agrowN(
            img: 'assets/timeline.png',
            stuff: 'Timeline'.tr,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const TimeLineSection();
              }));
            },
            color: Colors.white),
        agrowN(
            img: 'assets/agro.png',
            stuff: 'Agro News'.tr,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                // return const AgNewsWebScrape();
                return const AgroNewsNg();
                // return ChatPage();
              }));
            },
            color: Colors.white),
        agrowN(
            img: 'assets/cb.png',
            stuff: 'Chat'.tr,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChatPageScreen(
                  userName: currentUsersUserName,
                );
                // return ChatPage();
              }));
            },
            color: Colors.white),
        agrowN(
          img: 'assets/2gn.png',
          stuff: '(Local) News'.tr,
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
                  Container(
                    padding: const EdgeInsets.only(top: 2),
                    width: 200,
                    height: 25,
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(20)),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Center(
                        child: Text(
                          'AgricassistApp $stuff',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: color, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                ],
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
            child: Row(
              children: [
                Text(
                  'Location Details'.tr,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
                // _loading == true
                //     ? const Text(
                //         'Searching',
                //         style: TextStyle(color: Colors.red),
                //       )
                //     :
                // Text(
                //   latitude.toString(),
                //   style: const TextStyle(
                //       color: Colors.black,
                //       fontWeight: FontWeight.w400,
                //       fontSize: 14),
                // ),
                // const SizedBox(width: 5),
                // // _loading == true
                // //     ? const Text(
                // //         'Searching',
                // //         style: TextStyle(color: Colors.red),
                // //       )
                // //     :
                // Text(
                //   longitude.toString(),
                //   style: const TextStyle(
                //       color: Colors.black,
                //       fontWeight: FontWeight.w400,
                //       fontSize: 14),
                // ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cityDetail(
                        text: 'Current city'.tr,
                        icon: const Icon(
                          CupertinoIcons.home,
                          size: 25,
                          color: Colors.green,
                        ),
                        trl: widget.currentCity,
                        colr: Colors.grey.shade600),
                    cityDetail(
                        text: 'Markets'.tr,
                        icon: const Icon(
                          CupertinoIcons.cart_fill_badge_minus,
                          size: 25,
                          color: Colors.red,
                        ),
                        trl: ld[index].markets,
                        colr: Colors.green),
                    cityDetail(
                        text: 'Rainfall'.tr,
                        icon: const Icon(
                          CupertinoIcons.cloud_heavyrain_fill,
                          color: Colors.lightBlue,
                          size: 25,
                        ),
                        trl: weatherLoading == true
                            ? 'searching...'
                            : '$condition ($weatherDescription)',
                        colr: Colors.red),
                    cityDetail(
                        text: 'Current Temperature'.tr,
                        icon: const Icon(
                          CupertinoIcons.compass_fill,
                          color: Colors.brown,
                          size: 25,
                        ),
                        trl: weatherLoading == true
                            ? 'searching...'
                            : "$temperature\u00B0C",
                        colr: Colors.blue),
                    cityDetail(
                        text: 'Soil Type'.tr,
                        icon: const Icon(
                          CupertinoIcons.square_stack_3d_down_right,
                          size: 25,
                          color: Colors.green,
                        ),
                        trl: ld[index].soilType,
                        colr: Colors.brown),
                    cityDetail(
                        text: 'Soil pH range'.tr,
                        icon: const Icon(
                          CupertinoIcons.bolt_horizontal_fill,
                          color: Colors.orangeAccent,
                          size: 25,
                        ),
                        trl: ld[index].soilPh,
                        colr: Colors.brown),
                    cityDetail(
                        text: 'Water Bodies'.tr,
                        icon: const Icon(
                          CupertinoIcons.wand_rays,
                          color: Colors.lightBlue,
                          size: 25,
                        ),
                        trl: ld[index].availableWaterBodies,
                        colr: Colors.lightBlueAccent),
                    cityDetail(
                        text: 'Soil Nutrients (NPK)'.tr,
                        icon: const Icon(
                          CupertinoIcons.waveform,
                          size: 25,
                          color: Colors.brown,
                        ),
                        trl: ld[index].soilNutrients.toString(),
                        colr: Colors.lightBlueAccent),
                    cityDetail(
                        text: 'Soil Moisture'.tr,
                        icon: const Icon(
                          CupertinoIcons.arrow_down_right_circle,
                          color: Colors.red,
                          size: 25,
                        ),
                        trl:
                            // _loading == true
                            //     ? 'searching...'
                            //     : soilMoistureData.toString() == null
                            //         ? 'searching...'
                            //         :
                            soilMoistureData.toString(),
                        colr: Colors.lightBlueAccent),
                    cityDetail(
                        text: 'Tractability'.tr,
                        icon: const Icon(
                          CupertinoIcons.map,
                          size: 25,
                          color: Colors.pink,
                        ),
                        trl: tractability,
                        colr: Colors.blue),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: weatherLoading == true
                          ? null
                          : () {
                              // getPosition();
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
                              child: IntrinsicWidth(
                                child: Text(
                                  weatherLoading == true
                                      ? 'Loading...'
                                      : 'Check for more details here'.tr,
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
}

const kSoilStyle = TextStyle(fontWeight: FontWeight.w600, fontSize: 14.5);

const kTextStyle = TextStyle(fontWeight: FontWeight.w900, fontSize: 25);
