import 'package:flutter/material.dart';
import 'package:furni_hunt_dashboard/core/resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                    onTap: onTap ,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: BorderRadius.circular(8)),
                      child:  Center(child: Text(text)),
                    ),
                  );
  }
}