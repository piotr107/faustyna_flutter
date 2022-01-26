import 'dart:ui';

import 'package:faustyna/services/api_service.dart';
import 'package:faustyna/widgets/page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class ArticlePage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String? content;
  final String? pageId;
  const ArticlePage(
      {required this.title,
        required this.imageUrl,
        this.content,
        this.pageId});

  Widget _getPage() {
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
      body: ListView(
        children: [
          Html(
            data: content,
            style: {
              "body": Style(
                fontSize: FontSize(16),
              ),
            },
          ),
        ],
      )
    );
  }

  Widget _getPageDynamic() {
    final controller = Get.put(ArticlePageController(pageId: pageId!));
    return controller.obx((content) => Scaffold(
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
        body: ListView(
          children: [
            Html(
              data: content,
              style: {
                "body": Style(
                  fontSize: FontSize(13),
                  textAlign: TextAlign.justify
                ),
              },
            ),
          ],
        )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (pageId != null) {
      return _getPageDynamic();
    } else {
      return _getPage();
    }
  }
}
