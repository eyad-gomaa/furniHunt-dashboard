import 'package:flutter/material.dart';
import 'package:furni_hunt_dashboard/core/resources/color_manager.dart';

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: MediaQuery.sizeOf(context).width / 2,
        decoration: BoxDecoration(
            color: ColorManager.secondary,
            borderRadius: BorderRadius.circular(8)),
        child: Center(child: Text(text)),
      ),
    );
  }
}
