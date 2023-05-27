import 'dart:io';

import 'package:agro_assist/screens/custom_widgets/cont_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../log_in.dart';

class SettingsPageAgro extends StatefulWidget {
  const SettingsPageAgro({Key? key}) : super(key: key);

  @override
  State<SettingsPageAgro> createState() => _SettingsPageAgroState();
}

class _SettingsPageAgroState extends State<SettingsPageAgro> {
  TextEditingController textEditingController = TextEditingController();
  File? timeLineImage;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///app bar
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
            size: 20,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          'Settings',
          style: TextStyle(
              color: Colors.green, fontWeight: FontWeight.w800, fontSize: 15),
        ),
        actions: [
          Container(
            width: 30,
          )
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: timeLineImage == null
                  ? GestureDetector(
                      onTap: () {
                        getImageFromGallery();
                      },
                      child: const CircleAvatar(
                          child: Icon(CupertinoIcons.camera), radius: 120),
                    )
                  : CircleAvatar(
                      child: Image(image: FileImage(File(timeLineImage!.path))),
                      radius: 120)),
          textField(
              'Nick name',
              textEditingController,
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              null,
              false),
          const SizedBox(height: 50),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: contContinueButtonWithArrow(
                  text: 'Update',
                  onTaped: () {
                    if (timeLineImage == null) {
                      displayToast(context, 'please put up a picture',
                          Colors.red, Colors.white);
                    } else if (textEditingController.text == '') {
                      displayToast(context, 'please put up a nickname',
                          Colors.red, Colors.white);
                    } else {
                      updateProfile();
                    }
                  })),
        ],
      ),
    );
  }

  updateProfile() {
    CollectionReference useReference =
        FirebaseFirestore.instance.collection('users');
    var userId = FirebaseAuth.instance.currentUser!.uid;
    var profilePic = storeImageFileToStorage(File(timeLineImage!.path));
    useReference.doc(userId).update({
      'photoUrl': profilePic,
      'nickname': textEditingController.text.trim(),
    });
  }

  Future getImageFromGallery() async {
    var tempImage = await _picker.pickImage(source: ImageSource.gallery);
    try {
      setState(() {
        timeLineImage = File(tempImage!.path);
      });
    } catch (e) {
      displayToast(context, "$e", Colors.black54, Colors.white);
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

  Padding textField(text, TextEditingController contRl, tStyle, icon, obs) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 30.0,
        right: 30.0,
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
}
