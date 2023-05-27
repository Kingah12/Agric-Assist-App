import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../allProviders/models.dart';
import '../log_in.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  String currentUserUid = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUsersDetails();
  }

  String currentUsersUserName = '';
  String getUserProfilePic = '';

  ///getting current users username
  getCurrentUsersDetails() {
    final firestore = FirebaseFirestore.instance;
    final currentUser = FirebaseAuth.instance.currentUser;

    ///fetching userData
    firestore.collection('users').doc(currentUser!.uid).get().then((value) {
      var fields = value.data();
      setState(() {
        currentUsersUserName = fields!['nickname'];
        getUserProfilePic = fields['photoUrl'];
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
                  'Chats',
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("chats")
              // .where('users.$currentUserUid', isNull: true)
              // .where('users.$currentUserUid', isNotEqualTo: currentUserUid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              displayToast(context, 'please check your network', Colors.black26,
                  Colors.white);
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            ///getUser Data
            List data = !snapshot.hasData
                ? []
                : snapshot.data!.docs
                    .where((element) =>
                        element['users'].toString().contains(currentUserUid))
                    .toList();

            ///if no chat available or error msg
            try {
              if (data.isEmpty) {
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2.5,
                    ),
                    Text(
                      'You have no chat available!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                );
              }
            } catch (e) {
              e.toString();
            }

            ///if data is available
            // if (data.isNotEmpty) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  image: const DecorationImage(
                      filterQuality: FilterQuality.high,
                      image: AssetImage('assets/icon.png'))),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: ListView.builder(
                    // reverse: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      List users = data[index]['users'];
                      var friend =
                          users.where((element) => element != currentUserUid);
                      var user = friend.isNotEmpty
                          ? friend.first
                          : users.where((e) => e == currentUserUid).first;
                      // return Text('s'),
                      return data[index]['last_message'] == ''
                          ? Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 2.5,
                                ),
                                Text(
                                  'You have no chat available!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            )
                          : FutureBuilder(
                              future: FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(user)
                                  .get(),
                              builder: (context, AsyncSnapshot snapshot) {
                                return !snapshot.hasData
                                    ? Container()
                                    : Column(
                                        children: [
                                          ListTile(
                                            onTap: () {
                                              Models().callChatScreen_Page(
                                                  context,
                                                  user,
                                                  snapshot.data!['nickname'],
                                                  snapshot.data['photoUrl']);
                                            },
                                            leading: Stack(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage:
                                                      CachedNetworkImageProvider(
                                                          snapshot.data[
                                                              'photoUrl']),
                                                ),
                                                Positioned(
                                                  top: 1,
                                                  right: 1,
                                                  child: StreamBuilder(
                                                      stream: model.usersRef
                                                          .doc(user)
                                                          .snapshots(),
                                                      builder: (context,
                                                          AsyncSnapshot
                                                              snapshot) {
                                                        if (snapshot.hasData) {
                                                          return CircleAvatar(
                                                              radius: 7,
                                                              backgroundColor: snapshot
                                                                              .data![
                                                                          'status'] ==
                                                                      "online"
                                                                  ? Colors
                                                                      .lightGreen
                                                                  : Colors
                                                                      .blueGrey);
                                                        }
                                                        return Container();
                                                      }),
                                                ),
                                              ],
                                            ),
                                            subtitle: Text(
                                              "${data[index]['last_message']} ",
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13),
                                            ),
                                            title: Text(
                                              snapshot.data!['nickname'],
                                            ),
                                            trailing: Text(
                                              DateFormat('hh:mm a').format(
                                                  data[index]
                                                          ["last_message_time"]
                                                      .toDate()),
                                              style: TextStyle(fontSize: 12),
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
                    }),
              ),
            );
            // }
            // return Container();
          }),
    );
  }
}
