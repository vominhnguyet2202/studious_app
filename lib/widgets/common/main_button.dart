import 'package:flutter/material.dart';
import 'package:studious_app/configs/themes/app_color.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      this.title = '',
      required this.onTap,
      this.enabled = true,
      this.child,
      this.color});
  final String title;
  final VoidCallback onTap;
  final enabled;
  final Widget? child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 55,
        child: InkWell(
            onTap: enabled == false ? null : onTap,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: color ?? Theme.of(context).cardColor),
              child: child ??
                  Center(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: onSurfaceTextColor,
                      ),
                    ),
                  ),
            )),
      ),
    );
  }
}
