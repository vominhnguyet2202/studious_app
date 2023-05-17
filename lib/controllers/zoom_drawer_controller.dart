import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:studious_app/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/chat/chat_screen.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();
  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {}
  void website() {}
  void email() {
    final Uri emailLaunch =
        Uri(scheme: 'mailto', path: 'vominhnguyet1801@gmail.com');
    _launch(emailLaunch.toString());
  }

  void facebook() {
    launch("https://www.facebook.com");
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) {
      throw 'could not launch $url';
    }
  }
}
