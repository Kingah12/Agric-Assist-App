import 'package:agro_assist/model/location_details.dart';
import 'package:agro_assist/screens/home_page.dart';
import 'package:agro_assist/screens/log_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:flutter/widgets.dart';

class SelectLocationPage extends StatefulWidget {
  const SelectLocationPage({Key? key}) : super(key: key);

  @override
  _SelectLocationPageState createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  String sItem = 'select location';
  final List<String> _locations = <String>[
    "Agbogugu",
    "Agbudu",
    "Amoli",
    "Awgu",
    "Awgunta",
    "Ezere",
    "Ihe",
    "Isu-Awaa",
    "Ituku",
    "Mgbidi",
    "Mgbowo",
    "Mmaku",
    "Nenwenta",
    "Nkwe",
    "Obeagu",
    "Ogbaku",
    "Ogugu",
    "Owelli",
    "Ugbo",
    "Ugwueme",
  ];
  final List<LocationCityDetails> _locationDetails = <LocationCityDetails>[
    LocationCityDetails(
      currentcity: "Agbogugu",
      markets: " Orio Agbogugu",
      rainfall: 'loading..',
      currentTemperature: 'loading...',
      soilType: "Deep clay loam soil",
      soilPh: "3.9 - 4.6",
      availableWaterBodies: "Nvula Agbogugu",
      tractability: "loading...",
    ),
    LocationCityDetails(
      currentcity: "Amoli",
      markets: " Nkwo Uda-amoli",
      rainfall: 'loading..',
      currentTemperature: 'loading...',
      soilType: "Deep clay loam soil",
      soilPh: "4.9 - 5.9",
      availableWaterBodies: "Anizi River",
      tractability: "loading...",
    ),
    LocationCityDetails(
      currentcity: "Awgu",
      markets: "  Orio Awgu",
      rainfall: 'loading..',
      currentTemperature: 'loading...',
      soilType: "Alluvial Soil",
      soilPh: "3.6 - 5.2",
      availableWaterBodies: "Null",
      tractability: "loading...",
    ),
    LocationCityDetails(
      currentcity: "Ezere",
      markets: " Nkwo Ezere",
      rainfall: 'loading..',
      currentTemperature: 'loading...',
      soilType: "Deep clay loam soil",
      soilPh: "3.9 - 5.6",
      availableWaterBodies: "Iyioma",
      tractability: "loading...",
    ),
    LocationCityDetails(
      currentcity: "Mgbidi",
      markets: " Nkwo Mgbidi",
      rainfall: 'loading..',
      currentTemperature: 'loading...',
      soilType: "Sandy loam soil",
      soilPh: "4.7 - 6.1",
      availableWaterBodies: "  4 catchments",
      tractability: "loading...",
    ),
    LocationCityDetails(
      currentcity: "Ihe",
      markets: " Eke Ihe",
      rainfall: 'loading..',
      currentTemperature: 'loading...',
      soilType: "Sandy loam soil",
      soilPh: "4.2 - 5.4",
      availableWaterBodies: " null",
      tractability: "loading...",
    ),
    LocationCityDetails(
      currentcity: "Mgbowo",
      markets: " Eke Mgbowo",
      rainfall: 'loading..',
      currentTemperature: 'loading...',
      soilType: "Alluvial soil",
      soilPh: "4.1 - 5.9",
      availableWaterBodies: "Ezioha dam",
      tractability: "loading...",
    ),
    LocationCityDetails(
      currentcity: "Mmaku",
      markets: " Aho Mmaku, Eke Mmaku",
      rainfall: 'loading..',
      currentTemperature: 'loading...',
      soilType: "Shallow lithosol soil",
      soilPh: "4.1 - 5.9",
      availableWaterBodies: "Mmamu River, Omoh Mmaku",
      tractability: "loading...",
    ),
    LocationCityDetails(
      currentcity: "Nkwe",
      markets: "  Eke Nkwe",
      rainfall: 'loading..',
      currentTemperature: 'loading...',
      soilType: "shallow lithosol soil",
      soilPh: "3.8 - 5.4",
      availableWaterBodies: "Ezioha dam",
      tractability: "loading...",
    ),
    LocationCityDetails(
      currentcity: "Owelli",
      markets: " Nkwo Owelli",
      rainfall: 'loading..',
      currentTemperature: 'loading...',
      soilType: " Shallow lithosol soil",
      soilPh: "3.9 - 5.6",
      availableWaterBodies: "3 catchments",
      tractability: "loading...",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
            size: 25,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _locationDetails.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 200,
                      child: Image(image: AssetImage('assets/logo.png'))),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Please select your Location',
                    style: TextStyle(
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
                    dropDownList:
                        _locationDetails[index].currentcity as List<String>,
                    elevation: 20,
                    onDropDownItemClick: (value) {
                      setState(() {
                        sItem = value;
                      });
                    },
                    dropDownTopBorderRadius: 40,
                    selectedItem: sItem,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (sItem.contains('select location')) {
                        displayToast(context, 'please select a location',
                            Colors.black54, Colors.white);
                      } else {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(
                                currentCity:
                                    _locationDetails[index].currentcity,
                                markets: _locationDetails[index].markets,
                                rainfall: _locationDetails[index].rainfall,
                                currentTemperature:
                                    _locationDetails[index].currentTemperature,
                                soilType: _locationDetails[index].soilType,
                                soilPh: _locationDetails[index].soilPh,
                                availableWaterBodies: _locationDetails[index]
                                    .availableWaterBodies,
                                tractability:
                                    _locationDetails[index].tractability,
                              ),
                            ));
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
                              children: const [
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  'Next',
                                  style: TextStyle(
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
                  // DropdownButton
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
