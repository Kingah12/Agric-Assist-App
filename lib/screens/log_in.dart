import 'package:agro_assist/screens/sign_up.dart';
import 'package:agro_assist/screens/welcome_page.dart';
import 'package:agro_assist/select_location_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../main.dart';
import '../model/firestore_constants.dart';
import '../splash_screen.dart';
import 'progress_dialog.dart';

final GoogleSignIn gSignIn = GoogleSignIn();
final GoogleSignInAccount? gUser = gSignIn.currentUser;

class Log_In extends StatefulWidget {
  const Log_In({Key? key}) : super(key: key);

  @override
  _Log_InState createState() => _Log_InState();
}

class _Log_InState extends State<Log_In> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool obscure = false;
  bool _isLoggedIn = false;
  GoogleSignInAccount? _userObj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoggedIn
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 0, bottom: 12, right: 20),
                  child: Text(
                    'Welcome to Agro Assist',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
                  child: Text(
                    'Agro Assist is an Agricultural Mechanization Data Base and Expert Advisor developed by Precision/ E-Agriculture Research Group funded by TETfund'
                    ' National Research Fund 2020 stream. We shall provide you with data and advice to guide you in mechanization of your farm in'
                    ' Awgu L.G.A of Enugu State, Nigeria.',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        wordSpacing: 3,
                        height: 1.5),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
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
            )
          : ListView(
              scrollDirection: Axis.vertical,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        context.setLocale(const Locale("en"));
                      });
                    },
                    child: const Text(
                      'English',
                      style: TextStyle(color: Colors.white),
                    )),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        context.setLocale(const Locale("ig"));
                      });
                    },
                    child: const Text(
                      'Igbo',
                      style: TextStyle(color: Colors.white),
                    )),
                welcomeBack(),
                const SizedBox(height: 10),
                textFields(),
                signInButton(),
                const SizedBox(height: 30),
                googleSignIn(),
                signUpButton(),
                emmanuelMuyiwa(),
              ],
            ),
    );
  }

  Padding welcomeBack() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Welcome_Back'.tr(),
                textStyle:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ],
          ),
          Expanded(
              child: Image.asset(
            "assets/logo.png",
            scale: 2.7,
          ))
        ],
      ),
    );
  }

  Padding textFields() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          textField(
              "Enter email".tr(),
              _email,
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              null,
              false),
          const SizedBox(height: 20),
          textField(
              "Enter password".tr(),
              _password,
              const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.5,
                letterSpacing: 1,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                child: obscure
                    ? const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.black54,
                        size: 30,
                      )
                    : const Icon(
                        Icons.visibility_outlined,
                        color: Colors.green,
                        size: 30,
                      ),
              ),
              obscure)
        ],
      ),
    );
  }

  Padding textField(text, TextEditingController contRl, tStyle, icon, obs) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
      ),
      child: TextField(
        controller: contRl,
        textAlign: TextAlign.center,
        style: tStyle,
        obscureText: obs,
        decoration: InputDecoration(
            filled: true,
            suffixIcon: icon,
            fillColor: Colors.grey.shade300,
            hintText: '$text',
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 19,
              fontWeight: FontWeight.w900,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              // borderSide: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(40),
            )),
      ),
    );
  }

  Padding signInButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Sign In'.tr(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (_email.text.isEmpty) {
                    displayToast(
                        context,
                        'you need an email address to continue'.tr(),
                        Colors.red,
                        Colors.white);
                  } else if (!_email.text.contains("@")) {
                    displayToast(context, 'email is badly formatted'.tr(),
                        Colors.red, Colors.white);
                  } else if (_password.text.length < 6) {
                    displayToast(
                        context,
                        'password must be more than 6 characters '.tr(),
                        Colors.red,
                        Colors.white);
                  } else {
                    signInUser(context);
                  }
                },
                child: const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.arrow_forward_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'or',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector googleSignIn() {
    return GestureDetector(
      onTap: () {
        final gSignedIn = gSignIn.signIn().then((userData) {
          setState(() {
            displayToast(context, "you have logged in successfully".tr(),
                Colors.green, Colors.white);
            _isLoggedIn = true;
            _userObj = userData;
            // Navigator.pop(context);
          });
        }).catchError((e) {
          // Navigator.pop(context);
          displayToast(context, '${e.code}', Colors.red.shade900, Colors.white);
        });

        if (gSignedIn != null) {
          users.doc(_userObj!.id).set({
            FirestoreConstants.nickname: _userObj!.displayName,
            FirestoreConstants.photoUrl: _userObj!.photoUrl,
            FirestoreConstants.id: _userObj!.id,
            "createdAt": DateTime.now().millisecondsSinceEpoch.toString(),
            FirestoreConstants.chattingWith: null,
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 60,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: 20,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.black, width: 1),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                    image: AssetImage('assets/g.png'),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Sign In'.tr(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget signUpButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const SignUp();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dont' have an account?".tr(),
              style: kstyle,
            ),
            const SizedBox(
              width: 7,
            ),
            Text(
              "Create one!".tr(),
              style: kstyle,
            ),
          ],
        ),
      ),
    );
  }

  Padding emmanuelMuyiwa() {
    return Padding(
      padding: EdgeInsets.only(top: 100.0, bottom: 10),
      child: Center(
          child: Text(
        'powered by emmanuelmuyiwa19@gmail.com\n09022925316'.tr(),
        style: const TextStyle(color: Colors.black12),
      )),
    );
  }

  void signInUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const ProgressDialog();
        });

    final User? _userDetails = (await auth
            .signInWithEmailAndPassword(
                email: _email.text, password: _password.text)
            .catchError((e) {
      Navigator.pop(context);
      displayToast(context, '${e.code}', Colors.red, Colors.white);
    }))
        .user;

    if (_userDetails != null) {
      displayToast(context, 'you have logged in successfully'.tr(),
          Colors.green, Colors.white);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const WelcomePage();
      }));
    } else {
      Navigator.pop(context);
      auth.signOut().then((value) => displayToast(
          context,
          'Please check your internet connectivity'.tr(),
          Colors.red,
          Colors.white));
    }
  }
}

void displayToast(BuildContext context, title, bColor, tColor) {
  Fluttertoast.showToast(
      msg: title,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM_LEFT,
      timeInSecForIosWeb: 1,
      backgroundColor: bColor,
      textColor: tColor,
      fontSize: 16.0);
}

const kstyle =
    TextStyle(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 16);

const kAnimStyle = TextStyle(color: Colors.white, fontSize: 30);

void signOut(context) async {
  await auth.signOut();
  final gSignOut = await gSignIn.signOut().then((value) {
    displayToast(context, 'signed Out'.tr(), Colors.black54, Colors.white);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const Log_In();
    }));
  });
  await gSignIn.disconnect();
  if (gSignOut != null) {
    displayToast(
        context, 'Signed Out Successfully'.tr(), Colors.black54, Colors.white);
  }
}
