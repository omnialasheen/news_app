import 'package:flutter/material.dart';
import 'package:news_app/data/api/api_manager.dart';
import 'package:news_app/data/model/source_response.dart';
import 'package:news_app/ui/screen/home/tab/news/news_list/news_list.dart';

class NewsTab extends StatefulWidget {
  final String categoryId; 
  NewsTab(this.categoryId);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int currentTabIndex =0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSource(widget.categoryId),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return buildDate(snapshot.data!);
        }else if (snapshot.hasError){
          return Text(snapshot.error.toString());
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      });
  }

  Widget buildDate(List<Source> list) {
    return DefaultTabController(
      length: list.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            onTap:(index) {
              currentTabIndex = index;
              setState(() {});
            },
            tabs: list.map((source) => buildTabWidget(source.name??"", 
            currentTabIndex == list.indexOf(source))).toList()),
          Expanded(
            child: TabBarView(
              children: 
                list.map((source) => NewList(sourceId: source.id!)).toList(),))
        ])
    );
  }

  Widget buildTabWidget (String name, bool isSelected){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 2),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xff39A552) : Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: const Color(0xff39A552)),
      ),
      child: Text(name ,style: TextStyle(color: isSelected ? Colors.white : const Color(0xff39A552))));
  }
}