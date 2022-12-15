import 'package:flutter/material.dart';
import 'package:studious_app/configs/themes/custom_text_style.dart';
import 'package:studious_app/widgets/questions/custom_app_bar.dart';

import '../../configs/themes/app_color.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  static const String routeName = '/chat';
  // final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  // List<String> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(
          children: [
            const Text(
              "Chat",
              style: headerTitle,
            ),
            Container(
              color: const Color(0xffffffff),
            )
          ],
        ),
      ),
    ));
  }
}
