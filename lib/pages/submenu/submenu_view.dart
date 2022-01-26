import 'package:faustyna/constants/constants.dart';
import 'package:faustyna/pages/home/home_controller.dart';
import 'package:faustyna/pages/submenu/news_controller.dart';
import 'package:faustyna/widgets/drawer_menu_item.dart';
import 'package:faustyna/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SubMenuPage extends StatelessWidget {

  final String name;
  final String title;
  final String type;
  final String? url;
  SubMenuPage({
    required this.name,
    required this.title,
    required this.type,
    this.url
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case 'news_menu':
          return _newsMenu();

      case 'conf_menu':
        return _confMenu();

      case 'link':
        _launchURL(url!);
        Get.back();
        return Scaffold();

      case 'sms':
        _sendSMS("ddd", ["123123123"]);
        Get.back();
        return Scaffold();

      default:
        return Scaffold();
    }
  }

  Widget _newsMenu() {
    final controller = Get.put(NewsController());
    return controller.obx((newsData) => Scaffold(
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
        child: RefreshIndicator(
          onRefresh: controller.refreshPage,
          child: ListView(
            children: newsData!.map((item) => MenuItem(name: name, text: item.title, imageUrl: item.imageUrl, type: 'news_page', pageContent: item.content, pageExcerpt: item.excerpt)).toList(),
          ),
        ),
      ),
    ));
  }

  Widget _confMenu() {
    final HomePageController controller = Get.find();
    return controller.obx((menuData) => Scaffold(
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
        child: RefreshIndicator(
          onRefresh: controller.refreshPage,
          child: ListView(
            children: menuData!.subMenus[name]!.map((item) => MenuItem(name: name, text: item.text, imageUrl: item.imageUrl, type: 'article_page', pageId: item.pageId)).toList(),
          ),
        ),
      ),
    ));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _sendSMS(String message, List<String> recipents) async {
    String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

}
