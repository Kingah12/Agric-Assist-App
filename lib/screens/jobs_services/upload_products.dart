import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../custom_widgets/cont_button.dart';
import '../custom_widgets/cont_textField.dart';
import '../custom_widgets/custom_text.dart';
import '../log_in.dart';

class UploadProducts_Services extends StatefulWidget {
  const UploadProducts_Services({Key? key}) : super(key: key);

  @override
  State<UploadProducts_Services> createState() =>
      _UploadProducts_ServicesState();
}

class _UploadProducts_ServicesState extends State<UploadProducts_Services> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  File? timeLineImage;
  bool isLoading = false;
  final ImagePicker _picker = ImagePicker();
  String postId = Uuid().v1();
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            // SizedBox(
            //     width: 50, height: 50, child: Image.asset('assets/icon.png')),
            // const SizedBox(
            //   width: 5,
            // ),
            Text(
              'Upload',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Your Services',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            width: 30,
          )
        ],
      ),

      ///body
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upload a picture',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 17),
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: getImageFromGallery,
                  child: timeLineImage == null
                      ? Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black26),
                          child: const Icon(Icons.add_a_photo,
                              size: 20, color: Colors.black),
                        )
                      : Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black26),
                          child: Image.file(timeLineImage!),
                        ),
                ),
                const SizedBox(height: 20),

                ///Full name
                contTextField(
                    obscure: false,
                    contr: nameController,
                    text1: 'Full Name',
                    text2: 'John paul',
                    onTapObscure: () {}),

                ///phoneNumber
                contTextField(
                    obscure: false,
                    contr: phoneNumberController,
                    text1: 'Phone number',
                    text2: '+234 9022925316',
                    onTapObscure: () {}),

                ///email
                contTextField(
                    obscure: false,
                    contr: emailController,
                    text1: 'Email',
                    text2: 'emmanuelmuyiwa19@gmail.com',
                    onTapObscure: () {}),

                ///description
                const SizedBox(height: 10),
                const CustomTextWidget(
                  text: "Description",
                  textColor: Colors.black,
                  textSize: 14,
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
                const SizedBox(height: 15),

                ///submitButton
                contContinueButtonWithArrow(
                    text: isLoading == false ? 'Upload' : 'Uploading...',
                    onTaped: isLoading == false
                        ? () {
                            if (nameController.text == '') {
                              displayToast(
                                  context,
                                  'please put up your full name',
                                  Colors.red,
                                  Colors.white);
                            } else if (phoneNumberController.text == '') {
                              displayToast(context, 'please put a phone number',
                                  Colors.red, Colors.white);
                            } else if (emailController.text == '') {
                              displayToast(context, 'please put an email',
                                  Colors.red, Colors.white);
                            } else if (messageController.text == '') {
                              displayToast(context, 'describe this post please',
                                  Colors.red, Colors.white);
                            } else {
                              uploadPost();
                              displayToast(context, 'Upload successfully',
                                  Colors.green, Colors.white);
                              Navigator.pop(context);
                            }
                            // setState(() {
                            //   isLoading = true;
                            // });
                          }
                        : null),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///get pic from file
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

  DateTime timeStamp = DateTime.now();
  uploadPost() async {
    setState(() {
      isLoading = true;
    });
    final CollectionReference usersPostsForJobs =
        FirebaseFirestore.instance.collection('usersPostsForJobs');

    var postImage = timeLineImage == null
        ? ''
        : await storeImageFileToStorage(File(timeLineImage!.path));
    usersPostsForJobs.doc(postId).set({
      'postImage': postImage,
      'fullName': nameController.text.trim(),
      'phoneNumber': phoneNumberController.text.trim(),
      "email": emailController.text.trim(),
      'message': messageController.text.trim(),
      'postId': postId,
      'timeStamp': timeStamp,
    });
    setState(() {
      isLoading = false;
      postId = Uuid().v1();
    });
  }
}
