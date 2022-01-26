import 'dart:ui';

import 'package:faustyna/constants/constants.dart';
import 'package:faustyna/widgets/article_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class NewsPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String content;
  final String excerpt;
  const NewsPage(
      {required this.title,
        required this.imageUrl,
        required this.content,
        required this.excerpt});

  Widget _getWidget() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_outlined),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Text('')
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                imageUrl,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Html(
                    data: excerpt,
                    style: {
                      "body": Style(
                        fontSize: FontSize(16),
                      ),
                    },
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Column(
              children: [
                const Divider(
                  thickness: 1.2,
                  height: 0,
                  color: MAIN_COLOR
                ),
                GestureDetector(
                  onTap: () => Get.to(() => ArticlePage(title: title, imageUrl: imageUrl, content: content)),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
                    child: const Text(
                      "Zobacz całą wiadomość",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: MAIN_COLOR,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getWidget();
  }
}
