import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../models_auths/models.dart';
import '../log_in.dart';

class Calls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                backgroundColor: Colors.grey[200],
                automaticallyImplyLeading: false,
                expandedHeight: 100,
                flexibleSpace: const FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  title: Text(
                    'Calls',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
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
              .where('uid', isNotEqualTo: model.currentUserUid)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                data[index]["nickname"].toString());
                          },
                          leading: const CircleAvatar(),
                          subtitle: Text(data[index]['status']),
                          title: Text(data[index]['nickname']),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Icon(
                                Icons.call_sharp,
                                color: Colors.grey,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Missed',
                                // '/Outgoing/Incoming',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              )
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
        ));
  }
}
