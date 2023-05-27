import 'dart:convert';

import 'package:agro_assist/screens/log_in.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'cont_button.dart';
import 'cont_textField.dart';
import 'custom_text.dart';
// import 'package:starletter/Screens/Forgotten_Password_OTP_verification/OTP_Input_Code.dart';
// import 'package:starletter/Screens/Forgotten_Password_OTP_verification/OTP_Verification.dart';
// import 'package:starletter/Screens/SignUp_/SignUp_Page0.dart';
// import 'package:starletter/utils/reponsiveness.dart';
//
// import '../../Providers/Provider_auth.dart';
// import '../../utils/color_constants.dart';
// import '../../widgets/customTextWidget.dart';
// import '../Login_/Login_Page.dart';

class EmailUs_Page extends StatefulWidget {
  const EmailUs_Page({Key? key}) : super(key: key);

  @override
  State<EmailUs_Page> createState() => _EmailUs_PageState();
}

class _EmailUs_PageState extends State<EmailUs_Page> {
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  Future sendEmail(
      {required String name,
      required String email,
      required String subject,
      required String message}) async {
    final serviceId = "service_jfs0xke";
    final templateId = "template_nozqzqb";
    final userId = "l_ZegpTkElir0QOHp";

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final respone = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': "application/json"
        },
        body: jsonEncode({
          'service_id': serviceId,
          'template_id': templateId,
          "user_id": userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'user_message': message,
          }
        }));
    print(respone.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Email Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // contAppBar(title: 'Email Us'),
                const SizedBox(height: 30),
                contTextField(
                    obscure: false,
                    contr: nameController,
                    text1: 'Name',
                    text2: 'John paul',
                    onTapObscure: () {}),
                const SizedBox(height: 10),
                contTextField(
                    obscure: false,
                    contr: emailController,
                    text1: 'Email',
                    text2: 'emmanuelmuyiwa19@gmail.com',
                    onTapObscure: () {}),
                const SizedBox(height: 10),
                contTextField(
                    obscure: false,
                    contr: subjectController,
                    text1: 'Subject',
                    text2: 'My Subject',
                    onTapObscure: () {}),
                const SizedBox(height: 10),
                const CustomTextWidget(
                  text: "My Message",
                  textColor: Colors.black,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 200.0,
                  child: TextField(
                    controller: messageController,
                    cursorColor: Colors.black,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                    maxLines: 20,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        hintText: '',
                        fillColor: Colors.grey.shade300,
                        hintStyle:
                            const TextStyle(color: Colors.white, fontSize: 14)),
                  ),
                ),
                const SizedBox(height: 30),
                isLoading == false
                    ? contContinueButtonWithArrow(
                        text: 'Send',
                        onTaped: () {
                          setState(() {
                            isLoading = true;
                          });
                          sendEmail(
                                  name: nameController.text,
                                  email: emailController.text,
                                  subject: subjectController.text,
                                  message: messageController.text)
                              .then((value) {
                            setState(() {
                              isLoading = false;
                            });
                            displayToast(context, 'email sent successfully',
                                Colors.green, Colors.white);
                            Navigator.pop(context);
                          });
                        })
                    : const Center(child: CircularProgressIndicator())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
