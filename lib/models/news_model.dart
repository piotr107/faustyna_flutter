class NewsModel {
  final String title;
  final String imageUrl;
  final String content;
  final String excerpt;

  NewsModel({
    required this.title,
    required this.imageUrl,
    required this.content,
    required this.excerpt});

  NewsModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        imageUrl = json['attachments'][0]['url'],
        content = json['content'],
        excerpt = json['excerpt'];
}
