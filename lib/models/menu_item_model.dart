class MenuItemModel {
  final String name;
  final String text;
  final String imageUrl;
  final String type;
  final String? apiUrl;
  final String? url;
  MenuItemModel(
      {required this.name,
        required this.text,
        required this.imageUrl,
        required this.type,
        this.apiUrl,
        this.url});

  MenuItemModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        text = json['text'],
        imageUrl = json['imageUrl'],
        type = json['type'],
        apiUrl = json['apiUrl'],
        url = json['url'];
}
