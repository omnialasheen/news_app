import 'package:flutter/material.dart';
import 'package:news_app/ui/utils/AppTheme.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Language",style: AppTheme.drawerOption,),
        
      ],
    );
  }
}