import 'package:faustyna/pages/submenu/submenu_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerMenuItem extends StatelessWidget {
  final String text;
  final String type;
  final String name;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String? url;
  const DrawerMenuItem(
      {required this.text,
        required this.type,
        required this.name,
        required this.scaffoldKey,
        this.url});

  Widget _getWidget() {
    return Column(
      children: [
        ListTile(
          title: Text(
            text,
            style: const TextStyle(
                fontSize: 15,
                color: Colors.white
            ),
          ),
          onTap: () => navigate(),
          contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
          dense: true,
        ),
        const Divider(
          thickness: 1,
          height: 5,
          color: Colors.white10,
        ),
      ],
    );
  }

  void navigate() {
    Get.to(() => SubMenuPage(title: text, type: type, name: name, url: url,));
    scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return _getWidget();
  }
}
