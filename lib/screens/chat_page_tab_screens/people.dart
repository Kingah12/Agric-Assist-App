import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../allProviders/models.dart';
import '../../splash_screen.dart';
import '../chat_details.dart';
import '../log_in.dart';

class People extends StatefulWidget {
  People({Key? key}) : super(key: key);

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> with WidgetsBindingObserver {
  var currentUserUid = FirebaseAuth.instance.currentUser!.uid;

  ChatScreen(String nickname, String uid, BuildContext context, friendStatus,
      friendImage) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ChatsDetails(
        friendUid: uid,
        friendNickName: nickname,
        friendStatus: friendStatus,
        friendImage: friendImage,
      );
    }));
  }

  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    setStatus('online');
    getCurrentUsersUserName();
  }

  void setStatus(String status) async {
    await _fireStore
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update({'status': status});
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      //online
      setStatus('online');
    } else {
      //offline
      setStatus("offline");
    }
  }

  String currentUsersUserName = '';

  ///getting current users username
  Future<void> getCurrentUsersUserName() async {
    final firestore = FirebaseFirestore.instance;
    final currentUser = FirebaseAuth.instance.currentUser;

    ///fetching userType Data eg: user or recruiter
    await firestore.collection('users').doc(currentUserUid).get().then((value) {
      var fields = value.data();
      setState(() {
        currentUsersUserName = fields!['nickname'];
      });
    });
    // Provider.of<Models>(context, listen: false)
    //     .setUserName(currentUsersUserName);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          backgroundColor: Colors.grey[200],
          automaticallyImplyLeading: false,
          expandedHeight: 100,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            title: Row(
              children: [
                SizedBox(
                    width: 40,
                    height: 40,
                    child: Image.asset('assets/icon.png')),
                const SizedBox(width: 10),
                const Text(
                  'People',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            // background: Colors.red,
          ),
          floating: true,
          snap: true,
        ),
      ],
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where('uid', isNotEqualTo: currentUserUid)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            displayToast(context, 'please check your network connection',
                Colors.black26, Colors.white);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            var data = snapshot.data!.docs;
            return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Models().callChatScreen_Page(
                            context,
                            data[index]["uid"].toString(),
                            data[index]["nickname"].toString(),
                            data[index]['photoUrl'].toString(),
                          );
                        },
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              data[index]['photoUrl'].toString()),
                        ),
                        subtitle: Text(data[index]['status']),
                        title: Text(data[index]['nickname']),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Colors.grey,
                            ),
                            Text(
                              DateFormat('hh:mm a')
                                  .format(data[index]["createdAt"].toDate()),
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        child: Divider(
                          color: Colors.grey[300],
                        ),
                      )
                    ],
                  );
                });
          }
          return Container();
        },
      ),
    );
  }
}
