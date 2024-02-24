import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/articles_response.dart';
import 'package:news_app/widget/atrical_widget.dart';
import 'package:news_app/widget/error_view.dart';

class NewList extends StatelessWidget {
  final String sourceId; 
  const NewList({super.key,required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getArtical(sourceId),
      builder:(context, snapshot) {
        if(snapshot.hasData){
          return buildArticalListView(snapshot.data); 
        }else if(snapshot.hasError){
          return ErrorView(message: snapshot.error.toString());
        }else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },);
  }

  Widget buildArticalListView(List<Article>? article) {
    return ListView.builder(
      itemCount: article!.length,
      itemBuilder:(context, index) {
        return ArticleWidget(article: article[index]);
      },);
  }
}