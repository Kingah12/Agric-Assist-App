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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Agro Timeline',
          style: TextStyle(
            letterSpacing: 2,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
      body: Container(
        child: postLists.isEmpty
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.green,
              ))
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
        margin: const EdgeInsets.all(15.0),
        child: Container(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date,
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(image, fit: BoxFit.cover)),
              const SizedBox(height: 10),
              Text(
                description,
                style: const TextStyle(color: Colors.black, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
