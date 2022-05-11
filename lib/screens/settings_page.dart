import 'dart:io';
import 'package:agro_assist/allProviders/settings_provider.dart';
import 'package:agro_assist/model/firestore_constants.dart';
import 'package:agro_assist/model/user_chat.dart';
import 'package:agro_assist/screens/log_in.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController? controllerNickName;
  TextEditingController? controllerAboutMe;

  String dialCodeDigits = "+00";
  final TextEditingController _controller = TextEditingController();
  String id = "";
  String nickname = "";
  String aboutMe = "";
  String photoUrl = "";
  String phoneNumber = "";

  bool isLoading = false;
  File? avatarImageFile;
  late SettingsProvider settingsProvider;
  final FocusNode focusNodeNickname = FocusNode();
  final FocusNode focusNodeAboutMe = FocusNode();

  @override
  void initState() {
    super.initState();
    settingsProvider = context.read<SettingsProvider>();
    readLocal();
  }

  readLocal() {
    setState(() {
      id = settingsProvider.getPref(FirestoreConstants.id) ?? "";
      nickname = settingsProvider.getPref(FirestoreConstants.nickname) ?? "";
      aboutMe = settingsProvider.getPref(FirestoreConstants.aboutme) ?? "";
      photoUrl = settingsProvider.getPref(FirestoreConstants.photoUrl) ?? "";
      phoneNumber =
          settingsProvider.getPref(FirestoreConstants.phoneNumber) ?? "";
    });
    controllerNickName = TextEditingController(text: nickname);
    controllerAboutMe = TextEditingController(text: aboutMe);
  }

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile? pickedFile = await imagePicker
        .getImage(source: ImageSource.gallery)
        .catchError((err) {displayToast(context, '${err}', Colors.black, Colors.white)});

    File? image;
    if(pickedFile != null ){
      image = File(pickedFile.path);
    } if(image != null){
      setState(() {
      avatarImageFile = image;
      isLoading = true;
    });}
    upLoadFile();
  }

  Future upLoadFile()async{
     String fileName = id;
     UploadTask uploadTask = settingsProvider.uploadFile(avatarImageFile!, fileName);
     try{TaskSnapshot snapshot = await uploadTask;
     photoUrl = await snapshot.ref.getDownloadURL();
     UserChat updateInfo = UserChat(id: id, photoUrl: photoUrl,
         nickname: nickname, aboutMe: aboutMe, phoneNumber: phoneNumber);
     settingsProvider.updateDataFirestore(FirestoreConstants.pathUserCollection, id, updateInfo.toJson()).then((data) async{
       await settingsProvider.setPref(FirestoreConstants.photoUrl, photoUrl);
       setState(() {
         isLoading= false;
       });
     }).catchError((err){setState(() {
       isLoading=false;
     });displayToast(context, err.toString(), Colors.red
         , Colors.white);}
     );

     }on FirebaseException catch(e){
       setState(() {
         isLoading= false;
       });displayToast(context, e.message ?? e.toString(), Colors.black, Colors.white);
     }

  }

  void handleUpdateData (){
    focusNodeNickname.unfocus();
    focusNodeAboutMe.unfocus();
    setState(() {
      isLoading = true;
      if(dialCodeDigits != "+00" &&_controller.text != ""){
        phoneNumber = dialCodeDigits +_controller.text.toString();
      }
    });UserChat updateInfo = UserChat(id: id,
        photoUrl: photoUrl, nickname: nickname, aboutMe: aboutMe, phoneNumber: phoneNumber);
    settingsProvider.updateDataFirestore(FirestoreConstants.pathUserCollection, id, updateInfo.toJson()).then((data) async{
      await settingsProvider.setPref(FirestoreConstants.nickname, nickname);
      await settingsProvider.setPref(FirestoreConstants.aboutme, aboutMe);
      await settingsProvider.setPref(FirestoreConstants.photoUrl, photoUrl);
      await settingsProvider.setPref(FirestoreConstants.phoneNumber, phoneNumber  );
      setState(() {
        isLoading = false;
      });
      displayToast(context, "sucess", Colors.green, Colors.white);
    }).catchError((err){setState(() {
      isLoading= false;
    });displayToast(context, err.toString(), Colors.red, Colors.white);});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Container(
          child: const Center(
        child: Text('This is the settins page'),
      )),
    );
  }
}
