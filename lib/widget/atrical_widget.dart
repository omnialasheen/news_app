import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/widget/loading_widget.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  const ArticleWidget({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage!,
              placeholder: (context, url) => const LoadingWidget(),
              errorWidget:(context, url, error) => const Icon(Icons.error),
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height * 0.20,),
          ),
          Text(article.source?.name??""),
          Text(article.title??""),
          Text(article.publishedAt??"",textAlign: TextAlign.right,),
        ],
      ),
    );
  }
}