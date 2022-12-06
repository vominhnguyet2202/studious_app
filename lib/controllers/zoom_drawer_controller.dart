import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:studious_app/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();
  @override
  void onReady() {
    // user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {}
  void signIn() {}
  void website() {}
  void email() {
    final Uri emailLaunch =
        Uri(scheme: 'mailto', path: 'vominhnguyet1801@gmail.com');
    _launch(emailLaunch.toString());
  }

  void logout() {
    Get.find<AuthController>().signOut();
  }

  void facebook() {
    launch("https://facebook.com");
  }

  Future<void> _launch(String url) async {
    if (!await launch(url)) {
      throw 'could not launch $url';
    }
  }
}
