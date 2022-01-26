class SubMenuItemModel {
  final String text;
  final String imageUrl;
  final String pageId;
  SubMenuItemModel(
      {required this.text,
        required this.imageUrl,
        required this.pageId});

  SubMenuItemModel.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        imageUrl = json['imageUrl'],
        pageId = json['pageId'];
}
