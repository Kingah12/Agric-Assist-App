import 'package:agro_assist/screens/log_in.dart';
import 'package:agro_assist/screens/searchScreenPage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

bool loadingSearch = true;

class CitySearch extends StatefulWidget {
  CitySearch({
    Key? key,
  }) : super(key: key);
  @override
  State<CitySearch> createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  TextEditingController contR = TextEditingController();
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  filterQuality: FilterQuality.high,
                  image: AssetImage(
                    'assets/logo.png',
                  ))),
        ),
        Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextField(
                      onChanged: (value) {
                        cityName = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30)),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          fillColor: Colors.grey.shade200,
                          filled: true,
                          hintText: 'Search by city',
                          hintStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                if (cityName == '') {
                  displayToast(context, 'please enter a city ', Colors.red,
                      Colors.white);
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchedScreenPageByCity(cityName: cityName);
                  }));
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                      child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  )),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
