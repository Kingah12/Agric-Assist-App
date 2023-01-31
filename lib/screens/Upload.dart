import 'dart:io';

import 'package:agro_assist/screens/timeline_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../select_location_page.dart';
import 'log_in.dart';
import 'progress_dialog.dart';

class UploadTimeLine extends StatefulWidget {
  const UploadTimeLine({Key? key}) : super(key: key);

  @override
  _UploadTimeLineState createState() => _UploadTimeLineState();
}

class _UploadTimeLineState extends State<UploadTimeLine> {
  final ImagePicker _picker = ImagePicker();
  File? timeLineImage;
  TextEditingController contrl = TextEditingController();
  String? url;
  String? _myValue;
  SelectLocationPage ltion = const SelectLocationPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
          elevation: 20,
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.menu,
          activeIcon: Icons.close,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.camera_enhance_rounded),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              label: 'camera',
              onTap: getImagFromCamera,
              onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            ),
            SpeedDialChild(
              child: const Icon(Icons.add_photo_alternate_outlined),
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              label: 'gallery',
              onTap: getImagFromGallery,
              onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
            ),
          ],
        ),
        body: timeLineImage == null
            ? Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 30.0, top: 30),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Icon(Icons.arrow_back_ios)),
                    ),
                  ),
                  const SizedBox(
                    height: 250,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.image_sharp,
                      size: 100,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Select an Image',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            : UploadAnImage());
  }

  Widget UploadAnImage() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.35,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: FileImage(timeLineImage!)),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Stack(
            children: [
              Positioned(
                left: 20,
                top: 20,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: contrl,
            decoration: InputDecoration(
                hintText: "Description",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                  fontSize: 16,
                  letterSpacing: 0.5,
                )),
          ),
        ),
        const SizedBox(height: 60),
        OutlinedButton(
          // elevation: 15,
          // color: Colors.green,
          onPressed: uploadPost,
          child: const Text(
            'Add a post',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  void uploadPost() async {
    storage.Reference ref =
        storage.FirebaseStorage.instance.ref().child('Post Images');
    var timeKey = DateTime.now();

    if (contrl.text.trim().isEmpty) {
      displayToast(context, 'please fill in the description', Colors.black45,
          Colors.white);
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return const ProgressDialog();
          });
      final storage.UploadTask uploadTask =
          ref.child(timeKey.toString() + ".jpg").putFile(timeLineImage!);

      var ImageUrl = await (await uploadTask).ref.getDownloadURL();
      url = ImageUrl.toString();
      displayToast(context, 'post uploaded successfully !!!', Colors.green,
          Colors.white);
      saveDataToFireBase(url);
    }
  }

  void saveDataToFireBase(url) {
    final dbRef = FirebaseDatabase.instance.ref();

    var dbTimeKey = DateTime.now();
    var formatDate = DateFormat('MMM d, yyyy');
    var formatTime = DateFormat('EEEE, hh:mm aaa');

    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);

    var data = {
      'image': url,
      'description': contrl.text.trim(),
      'date': date,
      'time': time,
    };

    dbRef.child('Posts').push().set(data);
    Navigator.pop(context);
    goToHomePage();
  }

  void goToHomePage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const TimeLineSection();
    }));
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

  Future getImagFromCamera() async {
    var tempImage =
        await ImagePicker.platform.getImage(source: ImageSource.camera);
    setState(() {
      timeLineImage = File(tempImage!.path);
    });
  }
}
