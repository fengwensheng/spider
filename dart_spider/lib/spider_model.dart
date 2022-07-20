class SpiderModel {
  final String title;
  final String content;
  final String thumbnail;

  SpiderModel({
    required this.title,
    required this.content,
    required this.thumbnail,
  });

  @override
  String toString() => {
        'title': title,
        'content': content,
        'thumbnail': thumbnail,
      }.toString();
}
