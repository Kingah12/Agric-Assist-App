import 'package:agro_assist/select_location_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../splash_screen.dart';
import 'log_in.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    print(user?.email);
    print(gUser?.email);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10.0, top: 0, bottom: 12, right: 20),
          child: Text(
            'Welcome to Agro Assist',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 20),
          ),
        ),
        const SizedBox(height: 5),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
          child: Text(
            'Agro Assist is an Agricultural Mechanization Data Base and Expert Advisor developed by Precision/ E-Agriculture Research Group funded by TETfund'
            ' National Research Fund 2020 stream. We shall provide you with data and advice to guide you in mechanization of your farm in'
            ' AWGU L.G.A of Enugu State, Nigeria.',
            style: TextStyle(
                fontWeight: FontWeight.w500, wordSpacing: 3, height: 1.5),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SelectLocationPage();
            }));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 15.0, top: 15),
            child: Align(
              alignment: Alignment.centerRight,
              child: Material(
                borderRadius: BorderRadius.circular(40),
                elevation: 12,
                child: Container(
                  alignment: Alignment.centerRight,
// margin: const EdgeInsets.only(left: 200, top: 20, right: 15),
                  height: 47,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.green.shade600,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(40))),
                  child: const Center(
                      child: Text(
                    'Proceed',
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1.2,
                        fontSize: 18,
                        fontWeight: FontWeight.w800),
                  )),
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
