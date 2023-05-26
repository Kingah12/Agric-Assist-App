import 'package:agro_assist/model/article_view.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;

class AgNewsWebScrape extends StatefulWidget {
  const AgNewsWebScrape({Key? key}) : super(key: key);

  @override
  State<AgNewsWebScrape> createState() => _AgNewsWebScrapeState();
}

class _AgNewsWebScrapeState extends State<AgNewsWebScrape> {
  List<String> titles = [];
  List<String> images = [];
  List<String> urls = [];
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWebsiteData();
  }

  Future getWebsiteData() async {
    setState(() {
      isLoading = true;
    });
    // final url = Uri.parse('https://guardian.ng/tag/agriculture/');
    final url = Uri.parse('https://tribuneonlineng.com/category/agriculture/');
    final response = await http.get(url);

    ///getting the html datas
    dom.Document html = dom.Document.html(response.body);

    ///getting the title
    final titles = html
        .querySelectorAll(' h3.jeg_post_title > a')
        .map((e) => e.innerHtml.trim())
        .toList();

    ///getting the image
    final urlImages = html
        .querySelectorAll('a  > img')
        .map((e) => e.attributes['src']!)
        .toList();

    ///getting the url
    final urlLink = html
        .querySelectorAll('h3.jeg_post_title > a')
        .map((e) => e.attributes['href']!)
        .toList();

    setState(() {
      this.titles = titles;
      this.images = urlImages;
      this.urls = urlLink;
      isLoading = false;
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
              'News',
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
      body: Column(
        children: [
          isLoading == true
              ? const SizedBox(
                  height: 5,
                  child: LinearProgressIndicator(
                    color: Colors.green,
                    backgroundColor: Colors.black,
                  ),
                )
              : const SizedBox(),
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  final title = titles[index];
                  final urlImage = images[index];
                  final linkedUrls = urls[index];
                  // return Column(children: [
                  //   Text(title),
                  //   const SizedBox(height: 12),
                  //   Image.network(
                  //     urlImage,
                  //     width: double.infinity,
                  //     height: 100,
                  //     // filterQuality: FilterQuality.high,
                  //     fit: BoxFit.cover,
                  //   )
                  // ]);
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ArticleView(
                          url: linkedUrls,
                        );
                      }));
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        urlImage,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 14),
                    ),
                    subtitle: Text(
                      linkedUrls,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 10),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 12,
                  );
                },
                itemCount: titles.length),
          ),
        ],
      ),
    );
  }
}
// div.image.image > a > img
