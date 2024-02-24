import 'package:flutter/material.dart';
import 'package:news_app/data/model/category_dm.dart';
import 'package:news_app/ui/screen/home/tab/categories/categories.dart';
import 'package:news_app/ui/screen/home/tab/news/news_tab.dart';
import 'package:news_app/ui/screen/home/tab/setting/setting.dart';
import 'package:news_app/ui/utils/AppTheme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home Screen";
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget currentTab;
  late double hight;
  @override
  void initState() {
    super.initState();
    currentTab = CategoriesTab(onCategoryClick: onCategoryClick,);
  }
  
  @override
  Widget build(BuildContext context) {
    hight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        if(currentTab is! CategoriesTab){
          currentTab = CategoriesTab(onCategoryClick: onCategoryClick);
          setState(() {
            
          });
          return Future.value(false); 
        }else{
          return Future.value(true);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff39A552),
          //leading: const Icon(Icons.menu,color: Colors.white,),
          centerTitle: true,
          title: const Text("News App"),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(22))),
        ),
        body: currentTab,
        drawer: builDrawer(),
      ),
    );
  }

  onCategoryClick(CategoryDM categoryDM){
    currentTab = NewsTab(categoryDM.id);
    setState(() {});
  }
  
  builDrawer()=> Drawer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.green,
          ),
          child: Center(child: Text("News App!",style: AppTheme.appBarTitle))),
        buildDrawerRow(Icons.list, "Categories", (){
          currentTab = CategoriesTab(onCategoryClick: onCategoryClick);
          setState(() {});
          Navigator.pop(context);
        }),  
        buildDrawerRow(Icons.settings, "Setting", (){
          currentTab = SettingTab();
          setState(() {});
          Navigator.pop(context);
        })
      ],
    ),
  );
  buildDrawerRow(IconData iconData,String title,Function onclick){
    return InkWell(
      onTap: (){
        onclick(); 
      },
      child: Row(
            children: [
              const SizedBox(width: 16,),
              Icon(iconData,size: 35,),
              const SizedBox(width: 16,),
              Text(title,style: AppTheme.drawerOption,)
            ],
          ),
    );
  }
  
}