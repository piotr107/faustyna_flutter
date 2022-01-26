import 'package:faustyna/constants/constants.dart';
import 'package:faustyna/pages/home/home_controller.dart';
import 'package:faustyna/widgets/drawer_menu_item.dart';
import 'package:faustyna/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  _HomePageState();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomePageController());
    return controller.obx((menuData) => Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(menuData!.title),
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          icon: Icon(Icons.menu),
        ),
        /*actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('icons/ic_more_vert_white_48dp.png'),
          )
        ],*/
      ),
      bottomNavigationBar: const BottomAppBar(
          child: Text('')
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
          backgroundColor: Color.fromRGBO(32,32,34,1),
          child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: 110,
                  child: const DrawerHeader(
                      decoration: BoxDecoration(
                        color: MAIN_COLOR,
                      ),
                      child: SizedBox()
                  ),
                ),
                Column(
                  children: menuData.items.map((item) => DrawerMenuItem(text: item.text, type: item.type, name: item.name, scaffoldKey: _scaffoldKey, url: item.url,)).toList(),
                ),
              ]
          ),
        ),
      ),
      body: Center(
        child: RefreshIndicator(
          onRefresh: controller.refreshPage,
          child: ListView(
            children: [
              Image.network(
                  IMAGE_URL + menuData.mainImageUrl
              ),
              Column(
                children: menuData.items.map((item) => MenuItem(name: item.name, text: item.text, imageUrl: item.imageUrl, type: item.type, url: item.url,)).toList(),
              )
            ],
          ),
        ),
      ),
    ));
    }
  }
