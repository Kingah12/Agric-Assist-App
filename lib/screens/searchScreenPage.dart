import 'dart:convert';

import 'package:agro_assist/screens/citySearch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'home_page.dart';
import 'location_details.dart';

class SearchedScreenPageByCity extends StatefulWidget {
  final String cityName;
  const SearchedScreenPageByCity({
    Key? key,
    required this.cityName,
  }) : super(key: key);

  @override
  State<SearchedScreenPageByCity> createState() =>
      _SearchedScreenPageByCityState();
}

class _SearchedScreenPageByCityState extends State<SearchedScreenPageByCity> {
  CitySearch citySearch = CitySearch();
  dynamic? temperature;
  dynamic? condition;
  dynamic? weatherDescription;
  double? cityLatitude;
  double? cityLongitude;
  int? year1;
  int? month1;
  int? day1;
  double? soilMoistureData;
  String tractability = "no";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWeatherBit();
    // checkDate();
  }

  Future<void> reloadPage() async {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return SearchedScreenPageByCity(cityName: widget.cityName);
    }));
  }

  void getWeatherBit() async {
    // String api3Key = 'f96b792d35584262a1eedd716d88be6f';
    String api1Key = 'a8fee4b1f36843f8a0524d7646215a46';
    String api3Key = 'c1a22e967a864903ad39d097ec8b1bf3';
    String api5key = 'e672715bb75245fca9292265bdc6413a';
    String weatherDataUrl =
        'https://api.weatherbit.io/v2.0/current?city=${widget.cityName}&key=$api5key';
    http.Response response = await http.get(Uri.parse(weatherDataUrl));

    if (response.statusCode == 200) {
      String data = response.body;
      setState(() {
        temperature = jsonDecode(data)['data'][0]['temp'];
        condition = jsonDecode(data)['data'][0]['weather']['code'];
        weatherDescription =
            jsonDecode(data)['data'][0]['weather']['description'];
        loadingSearch = false;
      });
    } else {
      print('faild');
    }
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

  // getSoilMoistureData() async {
  //   String apikey = '912fefefec9f400b97c135bb5928d6c6';
  //   String api2key = 'a8fee4b1f36843f8a0524d7646215a46';
  //   // String api3key = 'f96b792d35584262a1eedd716d88be6f';
  //   String api3key = 'c1a22e967a864903ad39d097ec8b1bf3';
  //
  //   String url =
  //       'https://api.weatherbit.io/v2.0/history/agweather?lat=$cityLatitude&lon=$cityLongitude&start_date=$year1-$month1-2&end_date=$year1-$month1-$day1&key=$api3key';
  //
  //   http.Response response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     String data = response.body;
  //
  //     var soilM = jsonDecode(data)['data'][0]['v_soilm_0_10cm'];
  //     setState(() {
  //       soilMoistureData = soilM;
  //     });
  //   }
  //   print(response.statusCode);
  //   setTractability();
  //   print('this is the soilmoisture data: $soilMoistureData');
  // }

  // setTractability() {
  //   if (soilMoistureData! >= 0.6008) {
  //     setState(() {
  //       tractability = "No";
  //     });
  //   } else {
  //     setState(() {
  //       tractability = 'Yes';
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loadingSearch == true
          ? Container(
              color: Colors.transparent,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    color: Colors.green,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Searching...',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ],
              )),
            )
          : SizedBox(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, top: 20, bottom: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.arrow_back,
                                  color: Colors.black, size: 24)),
                          const SizedBox(width: 10),
                          SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.asset('assets/icon.png')),
                          const SizedBox(width: 10),
                          const Text(
                            'Searched City',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 23),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    cityDetail(
                        text: 'Current City',
                        icon: const Icon(
                          CupertinoIcons.home,
                          size: 25,
                          color: Colors.green,
                        ),
                        trl: widget.cityName,
                        colr: Colors.grey.shade600),
                    cityDetail(
                        text: 'Current Temperature',
                        icon: const Icon(
                          CupertinoIcons.compass_fill,
                          color: Colors.brown,
                          size: 25,
                        ),
                        trl: "${temperature ?? 'searching'}\u00B0C",
                        colr: Colors.blue),
                    cityDetail(
                        text: 'Rainfall',
                        icon: const Icon(
                          CupertinoIcons.cloud_heavyrain_fill,
                          color: Colors.lightBlue,
                          size: 25,
                        ),
                        trl:
                            '${condition ?? 'searching'} (${weatherDescription ?? 'searching'})',
                        colr: Colors.red),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LocationDetails(
                                rainfall: condition,
                              );
                            }));
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10.0, top: 13),
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
                                    'Check for more details here'.tr,
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
                    ),
                    // cityDetail(
                    //     text: 'Tractability',
                    //     icon: KoukiconsWorkflow(
                    //       height: 30,
                    //       width: 30,
                    //     ),
                    //     trl: tractability,
                    //     colr: Colors.blue),
                  ],
                ),
              ),
            ),
    );
  }

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
}
