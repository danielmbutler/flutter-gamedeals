class NewsArticle {
  final String title;
  String? author;
  String? description;
  String? urlToImage;
  final String url;
  final String publishedAt;
  String? content;

  NewsArticle({required this.title, this.author, this.description, this.urlToImage,
      required this.url, required this.publishedAt, this.content, });


  factory NewsArticle.fromJson(Map<String, dynamic> json){
    return NewsArticle(
        title: json['title'],
        author:json['author'],
        description: json['description'],
        urlToImage: json['urlToImage'],
        url: json['url'],
        publishedAt: json['publishedAt'],
        content: json['content']
    );
  }

}