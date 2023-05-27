import 'dart:io';

import 'package:agro_assist/model/firestore_constants.dart';
import 'package:agro_assist/screens/log_in.dart';
import 'package:agro_assist/screens/progress_dialog.dart';
import 'package:agro_assist/screens/welcome_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../select_location_page.dart';

GoogleSignInAccount? _userObj;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _nickName = TextEditingController();
  bool obscure = false;
  bool _isLoggedIn = false;
  late final SharedPreferences prefs;
  String image = 'assets/farmer1.jpg';
  File? timeLineImage;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoggedIn
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Expanded(
                //   child: CircleAvatar(
                //     radius: 120,
                //     backgroundImage: NetworkImage("${_userObj!.photoUrl}"),
                //   ),
                // ),
                // Text(
                //   '${_userObj!.email}',
                //   // "hello",
                //   style: TextStyle(fontSize: 18, color: Colors.black),
                // ),
                const Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 0, bottom: 12, right: 20),
                  child: Text(
                    'Welcome to AgricassistApp',
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
                    'AgricassistApp is an Agricultural Mechanization Data Base and Expert Advisor developed by Precision/ E-Agriculture Research Group funded by TETfund'
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
// margin: const EdgeInsets.only(left: 200, top: 20, right: 15),
                          height: 47,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.green.shade600,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(40))),
                          child: Center(
                              child: Text(
                            'Proceed'.tr,
                            style: const TextStyle(
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
                createAccount(),
                const SizedBox(height: 10),
                profilePic(),
                const SizedBox(height: 3),
                textFields(),
                signUpButton(),
                const SizedBox(height: 30),
                // googleSignIn(),
                signInButton(),
                emmanuelMuyiwa(),
              ],
            ),
    );
  }

  Padding createAccount() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Create Account'.tr,
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
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          textField(
              'Enter nickname'.tr,
              _nickName,
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              null,
              false),
          const SizedBox(height: 20),
          textField(
              "Enter email".tr,
              _email,
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              null,
              false),
          const SizedBox(height: 20),
          textField(
              "Enter password".tr,
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
            suffixIcon: icon,
            filled: true,
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

  Padding signUpButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Sign Up'.tr,
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
                        'you need an email address to continue',
                        Colors.red,
                        Colors.white);
                  } else if (!_email.text.contains("@")) {
                    displayToast(context, 'email is badly formatted',
                        Colors.red, Colors.white);
                  } else if (_password.text.length < 6) {
                    displayToast(
                        context,
                        'password must be more than 6 characters ',
                        Colors.red,
                        Colors.white);
                  } else if (timeLineImage == null) {
                    displayToast(context, "please set up a profile pic",
                        Colors.red, Colors.white);
                  } else if (_nickName.text.isEmpty) {
                    displayToast(context, "please put up a nickname",
                        Colors.red, Colors.white);
                  } else {
                    registerNewUser(context);
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
          Text(
            'or'.tr,
            style: const TextStyle(
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
        conectUsingGmail();
        // storeGsinginOnFireStore();
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
                'Sign In'.tr,
                style: const TextStyle(
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

  Widget signInButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const Log_In();
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Have an account?".tr,
                style: kstyle,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                "Sign In".tr,
                style: kstyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding emmanuelMuyiwa() {
    return Padding(
      padding: EdgeInsets.only(top: 100.0, bottom: 10),
      child: Center(
          child: Text(
        'powered by emmanuelmuyiwa19@gmail.com\n09022925316'.tr,
        style: const TextStyle(color: Colors.black12),
      )),
    );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///register new user
  void registerNewUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const ProgressDialog();
        });
    //creating user with email and password using firebase auth
    String photoUrl = await storeImageFileToStorage(File(timeLineImage!.path));
    final User? _user = (await _auth
            .createUserWithEmailAndPassword(
                email: _email.text, password: _password.text)
            .catchError((e) {
      Navigator.pop(context);
      displayToast(context, '${e.code}', Colors.red, Colors.white);
    }))
        .user;

    //adding user to firestore
    if (_user != null && photoUrl != null) {
      users.doc(FirebaseAuth.instance.currentUser!.uid).set({
        "email": _email.text.trim(),
        "password": _password.text.trim(),
        "createdAt": DateTime.now(),
        "nickname": _nickName.text.trim(),
        "status": 'online',
        FirestoreConstants.photoUrl: photoUrl,
        'uid': FirebaseAuth.instance.currentUser!.uid,
      }).then((value) {
        //display success signedUp
        displayToast(context, 'You have signed Up successfully', Colors.green,
            Colors.white);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            return const WelcomePage();
          }),
        );
      }).catchError((e) {
        Navigator.pop(context);
        displayToast(context, '${e.code}', Colors.red, Colors.white);
      });
    } else {
      Navigator.pop(context);
      displayToast(
          context,
          'no account created, please check your network connectivity!',
          Colors.red,
          Colors.white);
    }
  }

  // void storeGsinginOnFireStore() async {
  //   GoogleSignInAccount? googleUser = await gSignIn.signIn();
  //   if (googleUser != null) {
  //     GoogleSignInAuthentication? googleAuth =
  //         _userObj!.authentication as GoogleSignInAuthentication?;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleAuth!.accessToken, idToken: googleAuth.idToken);
  //
  //     User? firebaseUser =
  //         (await FirebaseAuth.instance.signInWithCredential(credential)).user;
  //     if (firebaseUser != null) {
  //       final QuerySnapshot result = await FirebaseFirestore.instance
  //           .collection(FirestoreConstants.pathUserCollection)
  //           .where(FirestoreConstants.id, isEqualTo: firebaseUser.uid)
  //           .get();
  //       final List<DocumentSnapshot> document = result.docs;
  //
  //       if (document.length == 0) {
  //         FirebaseFirestore.instance
  //             .collection(FirestoreConstants.pathUserCollection)
  //             .doc(_userObj!.id)
  //             .set({
  //           FirestoreConstants.nickname: _userObj!.displayName,
  //           FirestoreConstants.photoUrl: _userObj!.photoUrl,
  //           FirestoreConstants.id: _userObj!.id,
  //           "email": _userObj!.email,
  //           "createdAt": DateTime.now().millisecondsSinceEpoch.toString(),
  //           FirestoreConstants.chattingWith: null,
  //         });
  //       }
  //
  //       User? currentusers = firebaseUser;
  //       await prefs.setString(FirestoreConstants.id, currentusers.uid);
  //       await prefs.setString(
  //           FirestoreConstants.nickname, currentusers.displayName ?? "");
  //       await prefs.setString(
  //           FirestoreConstants.photoUrl, currentusers.photoURL ?? "");
  //       await prefs.setString(
  //           FirestoreConstants.phoneNumber, currentusers.phoneNumber ?? "");
  //     } else {
  //       DocumentSnapshot documentSnapshot =
  //           document as DocumentSnapshot<Object?>;
  //
  //       UserChat? userChat = UserChat.fromDocument(documentSnapshot);
  //
  //       await prefs.setString(FirestoreConstants.id, userChat!.id);
  //       await prefs.setString(
  //           FirestoreConstants.nickname, userChat!.nickname ?? "");
  //       await prefs.setString(
  //           FirestoreConstants.photoUrl, userChat!.photoUrl ?? "");
  //       await prefs.setString(
  //           FirestoreConstants.aboutme, userChat!.aboutMe ?? "");
  //       await prefs.setString(
  //           FirestoreConstants.phoneNumber, userChat!.phoneNumber ?? "");
  //     }
  //   }
  // }

  void conectUsingGmail() async {
    await gSignIn.signIn().then((userData) {
      setState(() {
        displayToast(context, "you have logged in successfully", Colors.green,
            Colors.white);
        _isLoggedIn = true;
        _userObj = userData;
        // Navigator.pop(context);
      });
    }).catchError((e) {
      // Navigator.pop(context);
      displayToast(context, '${e.code}', Colors.red.shade900, Colors.white);
    });
  }

  Padding profilePic() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: GestureDetector(
                onTap: getImagFromGallery,
                child: const Icon(
                  Icons.add,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            timeLineImage == null
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Icon(
                      Icons.image,
                      color: Colors.grey.shade500,
                      size: 40,
                    ),
                  )
                : CircleAvatar(
                    radius: 40,
                    backgroundImage: FileImage(timeLineImage!),
                  ),
          ],
        ),
      ),
    );
  }

  Future getImagFromGallery() async {
    var tempImage = await _picker.pickImage(source: ImageSource.gallery);
    try {
      setState(() {
        timeLineImage = File(tempImage!.path);
      });
    } catch (e) {
      displayToast(context, "$e", Colors.black54, Colors.white);
    }
  }
}

///storePostImage
storeImageFileToStorage(File? file) async {
  final metaData = SettableMetadata(contentType: 'image/jpeg');
  final storageRef = FirebaseStorage.instance.ref();
  Reference reference =
      storageRef.child('image/${DateTime.now().microsecondsSinceEpoch}.jpeg');
  final uploadTask = reference.putFile(file!, metaData);

  final taskSnapshot = await uploadTask.whenComplete(() => null);
  String url = await taskSnapshot.ref.getDownloadURL();
  return url;
}

const kstyle =
    TextStyle(color: Colors.green, fontWeight: FontWeight.w600, fontSize: 17.5);
