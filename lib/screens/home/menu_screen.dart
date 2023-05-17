import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studious_app/configs/themes/app_color.dart';
import 'package:studious_app/configs/themes/ui_paraments.dart';
import 'package:studious_app/controllers/zoom_drawer_controller.dart';
import 'package:studious_app/screens/youtube_play/video_screen.dart';
import 'package:studious_app/screens/youtube_play/watch_video.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParamenters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
          data: ThemeData(
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(primary: onSurfaceTextColor))),
          child: SafeArea(
            child: Stack(children: [
              Positioned(
                  top: 0,
                  right: 0,
                  child: BackButton(
                    color: Colors.white,
                    onPressed: () {
                      controller.toogleDrawer();
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.5),
                child: Column(
                  children: [
                    Obx(() => controller.user.value == null
                        ? const SizedBox()
                        : Text(
                            controller.user.value!.displayName ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                color: onSurfaceTextColor),
                          )),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          _DrawerButton(
                            icon: Icons.facebook,
                            label: "FaceBook",
                            onPressed: () => controller.facebook(),
                          ),
                          _DrawerButton(
                            icon: Icons.email,
                            label: "Email",
                            onPressed: () => controller.email(),
                          ),
                          _DrawerButton(
                            icon: Icons.video_collection,
                            label: "Video",
                            onPressed: () => Get.toNamed(WatchVideo.routeName),
                          ),
                          _DrawerButton(
                            icon: Icons.logout,
                            label: "Logout",
                            onPressed: () => controller.signOut(),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          )),
    );
  }
}

class _DrawerButton extends StatelessWidget {
  const _DrawerButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed});
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 15,
      ),
      label: Text(label),
    );
  }
}
