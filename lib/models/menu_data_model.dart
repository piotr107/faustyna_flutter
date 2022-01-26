import 'package:faustyna/models/menu_item_model.dart';
import 'package:faustyna/models/submenu_item_model.dart';

import 'menu_item_model.dart';

class MenuDataModel {
  final String title;
  final String mainImageUrl;
  final List<MenuItemModel> items;
  final Map<String, List<SubMenuItemModel>> subMenus;
  MenuDataModel(
      {required this.title,
        required this.mainImageUrl,
        required this.items,
        required this.subMenus});

  MenuDataModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        mainImageUrl = json['mainImageUrl'],
        items = (json['items'] as List)
            .map((e) => MenuItemModel.fromJson(e))
            .toList(),
        subMenus = (json['conf_menu'] as Map).map((key, value) => MapEntry<String, List<SubMenuItemModel>>(key, (value as List).map((e) => SubMenuItemModel.fromJson(e)).toList()));

}