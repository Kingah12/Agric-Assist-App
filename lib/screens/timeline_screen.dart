import 'package:agro_assist/model/posts.dart';
import 'package:agro_assist/screens/Upload.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'blog_full_screen.dart';

class TimeLineSection extends StatefulWidget {
  const TimeLineSection({Key? key}) : super(key: key);

  @override
  _TimeLineSectionState createState() => _TimeLineSectionState();
}

class _TimeLineSectionState extends State<TimeLineSection> {
  List<Posts> postLists = <Posts>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseReference postRef = FirebaseDatabase.instance.ref().child('Posts');
    postRef.once().then((event) {
      postLists.clear();
      dynamic keys = event.snapshot.value;
      dynamic Datas = event.snapshot.value;
      dynamic KEYS = keys.keys;
      // print(keys);
      for (var key in KEYS) {
        Posts posts = Posts(
          date: Datas[key]['date'],
          image: Datas[key]['image'],
          description: Datas[key]['description'],
          time: Datas[key]['time'],
        );
        postLists.add(posts);
      }
      setState(() {
        // print(postLists[3].time);
      });
    });
  }

  readData() {
    DatabaseReference postRef = FirebaseDatabase.instance.ref().child('Posts');
    postRef.once().then((event) {
      postLists.clear();
      dynamic keys = event.snapshot.value;
      dynamic Datas = event.snapshot.value;
      dynamic KEYS = keys.keys;
      // print(keys);
      for (var key in KEYS) {
        Posts posts = Posts(
          date: Datas[key]['date'],
          image: Datas[key]['image'],
          description: Datas[key]['description'],
          time: Datas[key]['time'],
        );
        postLists.add(posts);
      }
      setState(() {
        // print(postLists[0].time);
      });
    });
    // postRef.once().then((event) {
    //   DataSnapshot snap = event.snapshot;
    //   dynamic keys = snap.key;
    //   dynamic datas = snap.value;
    //   print(keys);
    // });
  }

  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const UploadTimeLine();
          }));
        },
        child: const Icon(
          Icons.add,
          color: Colors.green,
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Agro Post',
          style: TextStyle(
            letterSpacing: 2,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        child: postLists.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                    child: Icon(Icons.broken_image_outlined,
                        color: Colors.grey, size: 40),
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: Text(
                      'There are no post available\nplease make some!',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                  ),
                ],
              )
            : ListView.builder(
                reverse: false,
                itemCount: postLists.length,
                // physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PostUi(
                      image: postLists[index].image,
                      date: postLists[index].date,
                      description: postLists[index].description,
                      time: postLists[index].time);
                }),
      ),
    );
  }

  Widget PostUi(
      {required String image,
      required String date,
      required String description,
      required String time}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BlogPost(
            image: image,
            description: description,
          );
        }));
      },
      child: Card(
        elevation: 10,
        margin: const EdgeInsets.all(0.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      date,
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      time,
                      style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Image.network(image, fit: BoxFit.fill),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  description,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
