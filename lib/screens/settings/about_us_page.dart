import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ///back pressed button
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back))),
          ),

          ///rg logo
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Image(
                  // image: AssetImage('assets/srg.png'),
                  image: AssetImage('assets/logo.png'),
                  height: 300,
                  width: 300,
                ),
              ),

              ///rgs text
              IntrinsicHeight(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text(
                      'AgricassistApp is a web based user-interactive '
                      'software developed to assist farmers and related workers. It provides a decision support system to assist farmers make good choice of crop to cultivate in each of the farming localities in Awgu local government area of Enugu State based on soil data, weather data, available water bodies and markets. The App also provides risk assessment to the farmer for each of the crops that could be cultivated in each of the farming localities. AgricassistApp was developed by the Precision Agriculture Research Group with membership from various Institutions in Nigeria in collaboration with a private web based programmer.',
                      // 'RUZO GAMES is a software/game company who specializes in using great technology to building great products for solving problems.',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),

              // ///email address
              // Padding(
              //   padding: const EdgeInsets.only(left: 15.0, top: 5),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       ///contact us
              //       Text(
              //         'Contact Us',
              //         style: TextStyle(color: Colors.grey.shade500),
              //       ),
              //       const SizedBox(height: 5),
              //
              //       ///email address
              //       IntrinsicHeight(
              //         child: Container(
              //           margin: const EdgeInsets.symmetric(
              //               horizontal: 15, vertical: 2),
              //           padding: const EdgeInsets.symmetric(
              //               horizontal: 15, vertical: 10),
              //           width: double.infinity,
              //           decoration: BoxDecoration(
              //               color: Colors.grey.shade300,
              //               borderRadius: BorderRadius.circular(20)),
              //           child: Column(
              //             children: [
              //               ///email address
              //
              //               Row(
              //                 children: const [
              //                   Text(
              //                     'Email: ',
              //                     style: TextStyle(color: Colors.black),
              //                   ),
              //                   Text(
              //                     'emmanuelmuyiwa19@gmail.com: ',
              //                     style: TextStyle(
              //                         color: Colors.black,
              //                         fontWeight: FontWeight.w500),
              //                   ),
              //                 ],
              //               ),
              //               const SizedBox(height: 5),
              //
              //               ///phone number
              //               Row(
              //                 children: const [
              //                   Text(
              //                     'Phone no:',
              //                     style: TextStyle(
              //                         color: Colors.black,
              //                         fontWeight: FontWeight.w500),
              //                   ),
              //                   Text(
              //                     '  +234 902 292 5316 \n +234 915 406 5591  ',
              //                     style: TextStyle(
              //                         color: Colors.black,
              //                         fontWeight: FontWeight.w500),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
