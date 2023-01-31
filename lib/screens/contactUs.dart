import 'package:flutter/material.dart';

import '../splash_screen.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back))),
            ),
            const SizedBox(height: 5),
            const Center(
              child: Image(
                image: AssetImage('assets/logo.png'),
                filterQuality: FilterQuality.high,
                fit: BoxFit.contain,
                height: 280,
                width: 280,
              ),
            ),
            const Text(
              'Agro Assist',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(40)),
              child: Center(
                child: RichText(
                    text: TextSpan(children: [
                  const TextSpan(
                    text: 'Note: Thanks for choosing Agroassist',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  TextSpan(
                    text: ' ${auth.currentUser!.email ?? "user"}  ',
                    style: const TextStyle(color: Colors.red),
                  ),
                  const TextSpan(
                    text:
                        'Hope we were able to provide you with the informations you need to mechanize your farm. For further enquiry kindly call Or Email us on:',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ])),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(30)),
                width: 300,
                height: 60,
                child: Row(
                  children: const [
                    SizedBox(width: 10),
                    Icon(Icons.mail_outline_outlined),
                    SizedBox(width: 10),
                    Text('ozoemena.ani@unn.edu.ng',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14)),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(30)),
                width: 300,
                height: 60,
                child: Row(
                  children: const [
                    SizedBox(width: 10),
                    Icon(Icons.phone, size: 18),
                    SizedBox(width: 10),
                    Text('+234 817 158 0381',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
