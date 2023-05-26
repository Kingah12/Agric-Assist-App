import 'package:flutter/material.dart';

import 'News_datas/news_data.dart';
import 'article_view.dart';
import 'news_model.dart';

class NewCategoryArticle extends StatefulWidget {
  final String agroCategory;
  const NewCategoryArticle({Key? key, required this.agroCategory})
      : super(key: key);

  @override
  _NewCategoryArticleState createState() => _NewCategoryArticleState();
}

class _NewCategoryArticleState extends State<NewCategoryArticle> {
  List<NewsArticle> cateData = <NewsArticle>[];

  bool _loadng = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  getNews() async {
    CategoryNewsData newsClass = CategoryNewsData();
    await newsClass.getCategoryNewsArticle(widget.agroCategory);
    cateData = newsClass.news.cast<NewsArticle>();
    setState(() {
      _loadng = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const Text(
              'Agro',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              widget.agroCategory,
              style: const TextStyle(
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
      body: _loadng
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.green,
            ))
          : SingleChildScrollView(
              child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cateData.length,
                      itemBuilder: (context, index) => blogTile(
                          imageUrl: cateData[index].urlToImage,
                          title: cateData[index].title,
                          descr: cateData[index].description,
                          url: cateData[index].url))),
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
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
