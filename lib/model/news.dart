class News {
  late String id;
  late String url;
  late String title;
  late String text;
  late String publisher;
  late String author;
  late String image;
  late String date;

  News({
    required this.id,
    required this.url,
    required this.title,
    required this.text,
    required this.publisher,
    required this.author,
    required this.image,
    required this.date,
  });

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    title = json['title'];
    text = json['text'];
    publisher = json['publisher'];
    author = json['author'];
    image = json['image'];
    date = json['date'];
  }
}
