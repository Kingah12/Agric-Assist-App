// import 'package:agro_assist/model/article_view.dart';
// import 'package:agro_assist/model/category_article.dart';
// import 'package:agro_assist/model/category_model.dart';
// import 'package:agro_assist/model/local_newscategory.dart';
// import 'package:agro_assist/model/news_data.dart';
// import 'package:agro_assist/model/news_model.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// class AgroNews extends StatefulWidget {
//   const AgroNews({Key? key}) : super(key: key);
//
//   @override
//   _AgroNewsState createState() => _AgroNewsState();
// }
//
// class _AgroNewsState extends State<AgroNews> {
//   List<CategoryModel> categoryModel = getCategoryNews();
//
//   List<NewsArticle> newsArticle = <NewsArticle>[];
//
//   bool _loadng = true;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getNews();
//   }
//
//   getNews() async {
//     NewsData newsClass = NewsData();
//     await newsClass.getNewsArticle();
//     newsArticle = newsClass.news.cast<NewsArticle>();
//     setState(() {
//       _loadng = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: const Icon(
//               Icons.arrow_back_ios_outlined,
//               color: Colors.black,
//               size: 20,
//             ),
//           ),
//           backgroundColor: Colors.white,
//           centerTitle: false,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Text(
//                 'Agro',
//                 style:
//                     TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Text(
//                 'News',
//                 style: TextStyle(
//                   color: Colors.green,
//                   fontWeight: FontWeight.w800,
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             Container(
//               width: 30,
//             )
//           ],
//         ),
//         body: _loadng
//             ? const Center(
//                 child: CircularProgressIndicator(
//                 color: Colors.green,
//               ))
//             : SingleChildScrollView(
//                 child: Container(
//                     child: Column(
//                   children: [
//                     // Container(
//                     //   height: 70,
//                     //   child: ListView.builder(
//                     //       itemCount: categoryModel.length,
//                     //       scrollDirection: Axis.horizontal,
//                     //       shrinkWrap: true,
//                     //       itemBuilder: (context, index) => newsTile(
//                     //           imgUrl: categoryModel[index].imageUrl,
//                     //           title: categoryModel[index].title,
//                     //           category: categoryModel[index].title)),
//                     // ),
//                     Container(
//                       // height: 10,
//                       margin: EdgeInsets.symmetric(vertical: 10),
//                       child: ListView.builder(
//                           physics: const ClampingScrollPhysics(),
//                           itemCount: newsArticle.length,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) => blogTile(
//                                 imageUrl: newsArticle[index].urlToImage,
//                                 title: newsArticle[index].title,
//                                 descr: newsArticle[index].description,
//                                 url: newsArticle[index].url,
//                               )),
//                     ),
//                   ],
//                 )),
//               ));
//   }
//
//   Widget newsTile({required imgUrl, required title, required String category}) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => NewCategoryArticle(
//                 agroCategory: category.toLowerCase(),
//               ),
//             ));
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: CachedNetworkImage(
//                 imageUrl: imgUrl,
//                 height: 60,
//                 width: 100,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Container(
//               height: 60,
//               width: 100,
//               decoration: BoxDecoration(
//                 color: Colors.black54,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Center(
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.w800),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget blogTile({imageUrl, title, descr, url}) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(builder: (context) {
//           return ArticleView(
//             url: url,
//           );
//         }));
//       },
//       child: Material(
//         elevation: 20,
//         child: Container(
//           decoration: BoxDecoration(
//               color: Colors.grey.shade100,
//               borderRadius: BorderRadius.circular(20)),
//           margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           child: Column(
//             children: [
//               ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.network(imageUrl)),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0, bottom: 8),
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w800, fontSize: 18),
//                 ),
//               ),
//               Text(
//                 descr,
//                 style: const TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/article_view.dart';
import '../model/category_article.dart';
import '../model/category_model.dart';
import '../model/category_news.dart';
import '../model/news_model.dart';
import 'News_datas/news_data.dart';

class Agro_Jobs_services extends StatefulWidget {
  const Agro_Jobs_services({Key? key}) : super(key: key);

  @override
  _Agro_Jobs_servicesState createState() => _Agro_Jobs_servicesState();
}

class _Agro_Jobs_servicesState extends State<Agro_Jobs_services> {
  List<CategoryModel> categoryModel = getCategoryNews();

  List<NewsArticle> newsArticle = <NewsArticle>[];

  bool _loadng = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  ///get news function
  getNews() async {
    NewsData newsClass = NewsData();
    await newsClass.getNewsArticle();
    newsArticle = newsClass.news.cast<NewsArticle>();
    setState(() {
      _loadng = false;
    });
  }

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
            children: [
              SizedBox(
                  width: 50, height: 50, child: Image.asset('assets/icon.png')),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Agro',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Services/Jobs',
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
        body: _loadng
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.green,
              ))
            : SingleChildScrollView(
                child: Container(
                    child: Column(
                  children: [
                    ///category model
                    Container(
                      height: 70,
                      child: ListView.builder(
                          itemCount: categoryModel.length,
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => newsTile(
                              imgUrl: categoryModel[index].imageUrl,
                              title: categoryModel[index].title,
                              category: categoryModel[index].title)),
                    ),

                    ///news body
                    Container(
                      // height: 10,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: newsArticle.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => blogTile(
                                imageUrl: newsArticle[index].urlToImage,
                                title: newsArticle[index].title,
                                descr: newsArticle[index].description,
                                url: newsArticle[index].url,
                              )),
                    ),
                  ],
                )),
              ));
  }

  Widget newsTile({required imgUrl, required title, required String category}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewCategoryArticle(
                agroCategory: category.toLowerCase(),
              ),
            ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                height: 60,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 60,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget blogTile({imageUrl, title, descr, url}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ArticleView(
            url: url,
          );
        }));
      },
      child: Material(
        elevation: 20,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(imageUrl)),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 18),
                ),
              ),
              Text(
                descr,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
