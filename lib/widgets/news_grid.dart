import 'package:cached_network_image/cached_network_image.dart';
import 'package:first_app/screens/news_article_detai_screen.dart';
import 'package:first_app/viewmodels/news_article_view_model.dart';
import 'package:first_app/widgets/circle_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  static const String fakeImgUrl =
      "https://e3.365dm.com/21/11/768x432/skynews-breaking-sky-news_5597052.jpg?20211127140342";

  NewsGrid({required this.articles});

  void _showArticleDetails(context,article){
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsArticleDetailScreen(article: article,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        var article = articles[index];
        var image = article.imageUrl ?? fakeImgUrl;

        return GestureDetector(
          onTap: () {
            _showArticleDetails(context, article);
          },
          child: GridTile(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: CircleImage(image),
            ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child:  Text(
                article.title,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
              ),
            ),
          ),
        )
        ;
      },
      itemCount: articles.length,
    );
  }
}
