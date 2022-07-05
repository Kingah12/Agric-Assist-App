import 'package:agro_assist/screens/chat_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../splash_screen.dart';
import '../log_in.dart';

class People extends StatefulWidget {
  People({Key? key}) : super(key: key);

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> with WidgetsBindingObserver {
  var currentUser = FirebaseAuth.instance.currentUser!.uid;

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

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("users")
          .where('uid', isNotEqualTo: currentUser)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          displayToast(context, 'please check your network connection',
              Colors.black26, Colors.white);
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return CustomScrollView(slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 150,
              elevation: 30,
              floating: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.green[200],
                ),
                centerTitle: false,
                title: const Text(
                  'People',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildListDelegate(
                    snapshot.data.docs.map<Widget>((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ListTile(
                onTap: () => ChatScreen(data['nickname'], data['uid'], context,
                    data['status'], data['photoUrl']),
                title: Text(data['nickname'].toString()),
                subtitle: Text(data['status'].toString()),
              );
            }).toList())),
          ]);
        }
        return Container();
      },
    );
  }
}
