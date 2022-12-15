import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studious_app/screens/chat/chat_screen.dart';
import 'package:studious_app/screens/home/home_screen.dart';

class BottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: controller.tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.contact_support_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          const HomeScreen(),
          ChatScreen(),
        ],
      ),
    );
  }
}

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(vsync: this, length: 2);
    super.onInit();
  }
}
