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
      body: Container(
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
                dropDownList: _locations,
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
                                  location: sItem,
                                )));
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
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
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
      ),
    );
  }
}
