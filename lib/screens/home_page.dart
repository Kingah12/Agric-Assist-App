import 'package:agro_assist/model/agro_news.dart';
import 'package:agro_assist/model/category_model.dart';
import 'package:agro_assist/model/category_news.dart';
import 'package:agro_assist/model/news_data.dart';
import 'package:agro_assist/model/news_model.dart';
import 'package:agro_assist/screens/chat_page_screen.dart';
import 'package:agro_assist/screens/chat_screen.dart';
import 'package:agro_assist/screens/log_in.dart';
import 'package:agro_assist/screens/news_page.dart';
// import 'package:agro_assist/screens/seetings_page.dart';
import 'package:agro_assist/screens/sign_up.dart';
import 'package:agro_assist/screens/timeline_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koukicons/location.dart';
import 'package:koukicons/manager.dart';
import 'package:koukicons/scatterPlot.dart';
import 'package:koukicons/speed.dart';
import 'package:koukicons/cloudWarning.dart';
import 'package:koukicons/workflow.dart';
import '../splash_screen.dart';
import 'category_news.dart';
import 'location_details.dart';

class HomePage extends StatefulWidget {
  final String location;
  const HomePage({Key? key, required this.location}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NewsArticle> newsArticle = <NewsArticle>[];
  List<NewsArticle> newsCategory = <NewsArticle>[];
  // late String newsApiUrl =
  //     "https://newsapi.org/v2/top-headlines?country=ng&category=business&apiKey=n$newsAPiKey";
  // // 'https://newsapi.org/v2/top-headlines?country=ng&category=business&apiKey=$newsAPiKey';
  // String newsAPiKey = '0e9af026cd5d42b8a45717b4d5c10387';
  // String newsMediaApikey = 'ac0e009ec4bed092723254e9d1e3e2bc';
  // String apiKey = '939fe473dbe4e7ee508a038ce5ed43a5';
  // late String newsMediaUrl =
  //     'http://api.mediastack.com/v1/news?access_key=$newsMediaApikey&country=ng';

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getPermission();
  //   getLocation();
  // }
  //
  // Future<Position?> getPermission() async {
  //   LocationPermission permission;
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.deniedForever) {
  //       displayToast(context, 'please check permissions status', Colors.black38,
  //           Colors.white);
  //       return Future.error('Location Not Available');
  //     }
  //   } else {
  //     throw Exception('Error');
  //   }
  // }
  //
  // void getLocation() async {
  //   Position newPosition = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   latitude = newPosition.latitude;
  //   longitude = newPosition.longitude;
  // }
  //
  // void getData() async {
  //   final url =
  //       'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey';
  //
  //   http.Response response = await http.get(Uri.parse(url));
  //   // print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     String data = response.body;
  //     var temperature = jsonDecode(data)['main']['temp'];
  //     var wederDesc = jsonDecode(data)['cod'];
  //     var cityName = jsonDecode(data)['name'];
  //     print(temperature);
  //     print(wederDesc);
  //     print(cityName);
  //   } else {
  //     displayToast(
  //         context,
  //         'reload the app again theres an error!: ${response.statusCode}',
  //         Colors.black45,
  //         Colors.white);
  //   }
  // }
  List<CategoryModel> category = getCategoryNews();

  bool _loadng = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    category = getCategoryNews();
    getNews();
  }

  getNews() async {
    NewsData newsClass = NewsData();
    await newsClass.getNewsArticle();
    newsArticle = newsClass.news.cast<NewsArticle>();
    setState(() {
      _loadng = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return const SettingsPage();
            // }));
          },
          elevation: 12,
        ),
        body: _loadng == true
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
                          return HomePage(location: widget.location);
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
                      const SizedBox(height: 10),
                      title(),
                      const SizedBox(height: 4),
                      newsText(),
                      const SizedBox(height: 7),
                      agroSlider(),
                      const SizedBox(height: 50),
                      locationDetails(),
                    ],
                  ),
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
                return ChatPage();
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
              return const LocalNews();
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
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Text(
              'Agro Details',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(50),
            elevation: 10,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey.shade200,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 1.0, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    cityDetail(
                        text: 'Current city',
                        icon: KoukiconsLocation(
                          height: 30,
                          width: 30,
                        ),
                        trl: widget.location,
                        colr: Colors.grey.shade600),
                    cityDetail(
                        text: 'Markets',
                        icon: KoukiconsManager(
                          height: 30,
                          width: 30,
                        ),
                        trl: "loading...",
                        colr: Colors.grey.shade600),
                    cityDetail(
                        text: 'Rainfall',
                        icon: KoukiconsCloudWarning(
                          height: 30,
                          width: 30,
                        ),
                        trl: widget.location,
                        colr: Colors.grey.shade600),
                    cityDetail(
                        text: 'Current Temperature',
                        icon: KoukiconsScatterPlot(
                          height: 40,
                          width: 40,
                        ),
                        trl: "20\u00B0C",
                        colr: Colors.grey.shade600),
                    cityDetail(
                        text: 'Soil Type Temperature',
                        icon: KoukiconsSpeed(
                          height: 30,
                          width: 30,
                        ),
                        trl: "Loamy Soil",
                        colr: Colors.grey.shade600),
                    cityDetail(
                        text: 'Soil pH range',
                        icon: KoukiconsWorkflow(
                          height: 30,
                          width: 30,
                        ),
                        trl: "Loamy Soil",
                        colr: Colors.grey.shade600),
                    cityDetail(
                        text: 'Available Water Bodies',
                        icon: KoukiconsCloudWarning(
                          height: 30,
                          width: 30,
                        ),
                        trl: "null",
                        colr: Colors.red),
                    cityDetail(
                        text: 'Tractability',
                        icon: KoukiconsWorkflow(
                          height: 30,
                          width: 30,
                        ),
                        trl: "null",
                        colr: Colors.red),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        // getData();
                        // getNewsData();
                        const LocationDetails();
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cityDetail({required String text, required Widget icon, trl, colr}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
            right: 10.0, left: 8.0, bottom: 1.0, top: 5.0),
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
