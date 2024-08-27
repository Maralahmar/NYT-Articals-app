import 'package:flutter/material.dart';
import 'package:mariam_task/widgets/drawer_icon_button.dart';
import 'package:mariam_task/widgets/search_icon_button.dart';
import 'more_options_icon.dart';

class NyAppBar {
  final BuildContext context;
  NyAppBar(this.context);
  AppBar createBaseAppbar(String title) {
    return AppBar(
      // elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.greenAccent.shade200,
      leading: DrawerIconButton(),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w400),),
      actions: [
        SearchIconButton(),
        MoreOptionIconButton()
      ],
    );
  }
}