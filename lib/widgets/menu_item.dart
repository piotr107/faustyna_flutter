import 'package:faustyna/constants/constants.dart';
import 'package:faustyna/pages/submenu/submenu_view.dart';
import 'package:faustyna/widgets/article_page.dart';
import 'package:faustyna/widgets/news_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuItem extends StatelessWidget {
  final String name;
  final String text;
  final String imageUrl;
  final String type;
  final String? pageContent;
  final String? pageExcerpt;
  final String? pageId;
  final String? url;

  const MenuItem(
      {required this.name,
        required this.text,
        required this.imageUrl,
        required this.type,
        this.pageContent,
        this.pageExcerpt,
        this.pageId,
        this.url});

  Widget _getWidget() {
    return GestureDetector(
      onTap: () => navigate(),
      child: Container(
          padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                Image.network(
                    type == 'news_page' ? imageUrl : IMAGE_URL + imageUrl,
                    height: 110
                ),
                Expanded(
                    child: Container(
                      height: 110,
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: Text(
                        text,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                )
              ],
            ),
          )
      ),
    );
  }

  void navigate() {
    if (type == 'news_page') {
      Get.to(() => NewsPage(title: text, imageUrl: imageUrl, content: pageContent!, excerpt: pageExcerpt!));
    } else if (type == 'article_page') {
      Get.to(() => ArticlePage(title: text, imageUrl: imageUrl, pageId: pageId));
    } else if (type == 'link') {
      Get.to(() => SubMenuPage(title: text, type: type, name: name, url: url));
    } else {
      Get.to(() => SubMenuPage(title: text, type: type, name: name));
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getWidget();
  }
}
