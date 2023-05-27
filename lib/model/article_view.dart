import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String url;
  const ArticleView({Key? key, required this.url}) : super(key: key);

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();
  int? prog;
  double webProgress = 0;
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
            Text(
              'Agro',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            webProgress < 1
                ? SizedBox(
                    height: 5,
                    child: LinearProgressIndicator(
                      value: webProgress,
                      color: Colors.green,
                      backgroundColor: Colors.black,
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: widget.url,
                onWebViewCreated: ((WebViewController webViewController) {
                  _completer.complete(webViewController);
                }),
                onProgress: (progress) {
                  setState(() {
                    this.webProgress = progress / 100;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
